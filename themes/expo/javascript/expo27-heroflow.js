/**
 * expo27-heroflow.js
 * Hero-Wortfluss „Cyber-Donau": Begriffe (deutsch / englisch / serbisch-
 * kyrillisch) fliessen in mehreren Bahnen ueber das Lichtband aus
 * img/cyber-donau.webp und folgen dabei — gebogen — dem Verlauf der
 * Lichtwellen. Vorbild ist die LCD-Videoprojektion im Pavillon.
 *
 * Zwei Entscheidungen tragen die gesamte Komponente:
 *
 * 1. Bild und Textpfade liegen im SELBEN SVG-Koordinatensystem
 *    (viewBox 0 0 1920 1160). Dadurch klebt der Text bei jeder Bildschirm-
 *    groesse am Band, ohne dass zwei Skalierungslogiken synchron gehalten
 *    werden muessen — und der responsive Ausschnitt wird zu einer reinen
 *    viewBox-Aenderung, die Bild und Text zwangslaeufig gemeinsam mitnimmt.
 *
 * 2. Die Bahnen werden NICHT von Hand gezeichnet, sondern zwischen Ober- und
 *    Unterkante des Bandes interpoliert:
 *        Bahn_k(x) = oben(x) + t_k * (unten(x) - oben(x))
 *    Die Kanten stammen aus dem Alphakanal des Bildes (siehe
 *    demo-Planing/tools/extract-band-edges.py, Daten in
 *    data/donau-band-edges.json). Dadurch verengen und spreizen sich die
 *    Bahnen automatisch mit dem Band, und die Bahnanzahl N ist ein freier
 *    Laufzeitparameter — genau das, was die responsive Anforderung braucht.
 *
 * API (analog ExpoFlow / ExpoRipple / ExpoTextFlow):
 *   window.ExpoHeroFlow.mount(container, options) -> instance
 *   instance: { start(), stop(), destroy() }
 *
 * Dekorativ: der Container ist aria-hidden. Respektiert
 * prefers-reduced-motion (Standbild statt Loop) und pausiert ausserhalb des
 * Viewports.
 */
(function () {
  "use strict";

  var REDUCE_MOTION = window.matchMedia("(prefers-reduced-motion: reduce)").matches;
  var SVGNS = "http://www.w3.org/2000/svg";
  var SEP = "     ·     ";
  var IMG = "/_resources/themes/expo/images/cyber-donau.webp";
  var SRC_W = 1920, SRC_H = 1160;

  /* Ausschnitte je Breakpoint. Das Bild ist 1,66:1 — auf Smartphone-Breite
     komplett skaliert waere das Band ~227px hoch und die Bahnabstaende 20-35px,
     also unbrauchbar. Statt zu verkleinern wird deshalb die viewBox beschnitten
     ("Ausschnitt zoomen"): mobil nur der Wellenkern (Kamm + Tal), der
     ausdrucksstaerkste Abschnitt. Weil Bild und Pfade denselben Raum teilen,
     stimmt der Ausschnitt fuer beide automatisch.

     font ist die ANGESTREBTE Schriftgroesse in CSS-Pixeln. Aus ihr folgt die
     Bahnanzahl (wie viele Bahnen dieser Groesse passen in die gerenderte
     Banddicke?), und aus der Bahnanzahl wiederum die tatsaechliche
     Schriftgroesse in viewBox-Einheiten. Beide haengen damit an derselben
     Zahl — sonst laufen sie auseinander. */
  var VIEWS = [
    { min: 1200, box: [80, 20, 1840, 700],  font: 20, minLanes: 4, maxLanes: 8 },
    { min: 768,  box: [180, 30, 1470, 650], font: 17, minLanes: 4, maxLanes: 6 },
    { min: 0,    box: [380, 60, 900, 560],  font: 14, minLanes: 3, maxLanes: 4 }
  ];

  /* Bahn-Profile als Zyklus statt fester Tabelle: fuer beliebiges N werden die
     ersten N Werte genommen (danach wiederholend). So ist bei jeder Bahnzahl —
     auch bei N=3 — eine grosse, eine kleine und eine mittlere Bahn dabei.
     Die Tempo-Faktoren sind bewusst ohne gemeinsamen Teiler gewaehlt, damit die
     Bahnen nicht in Gleichtakt geraten. */
  var SIZE_CYCLE  = [1.08, 0.76, 1.25, 0.88, 1.16, 0.68, 1.00, 0.82];
  var SPEED_CYCLE = [1.00, 0.74, 1.26, 0.87, 1.13, 0.65, 0.96, 1.34];
  var ALPHA_CYCLE = [0.55, 0.40, 0.65, 0.45, 0.60, 0.35, 0.50, 0.42];
  /* Farbzyklus mit Laenge 10 (teilerfremd zu SIZE_CYCLE/COUNT_CYCLE, damit
     sich die Kombinationen nicht periodisch wiederholen). Index 5 ist ein
     dunkles Navy: im hellweissen Bandkern verschwindet helle Schrift, dort
     liest sich das Wort als Aussparung im Licht — genauso arbeitet die
     LCD-Projektion im Pavillon (Wort-Fluss-Excerpt.png). */
  var COLOR_CYCLE = [0, 2, 5, 1, 3, 5, 0, 4, 2, 1];

  /* Farbzyklus fuer Bahnen ueber hellem Untergrund: nur dunkle Toene
     (5 = Navy, 4 = Mittelblau). */
  var DARK_COLOR_CYCLE = [5, 4, 5, 5, 4, 5, 5];

  /* Gemessene Helligkeit des Bandes unter einer Bahn (img/cyber-donau.webp
     ueber dunkelblauem Grund, Mittel entlang der sichtbaren Breite, 0..255),
     Stuetzstellen t = 0.13 bis 0.87 in gleichen Schritten.

     Das Band ist an BEIDEN Raendern am hellsten (~180-193) und in der MITTE am
     dunkelsten (~139-155) — helle Schrift verschwindet also gerade aussen,
     nicht innen. Die drei Ausschnitte (Desktop/Tablet/Mobile) weichen um
     hoechstens 8 voneinander ab, ein Profil genuegt fuer alle. */
  var LANE_LUMA = [180, 189, 140, 142, 139, 147, 155, 168, 180, 193, 185];
  var LUMA_T0 = 0.13, LUMA_T1 = 0.87;
  var BRIGHT_LUMA = 160;

  /* Sequenzlaengen je Bahn, paarweise weitgehend teilerfremd. Der Wortvorrat
     ist mit 24 Begriffen x 3 Sprachen klein; gleich lange Sequenzen wuerden
     sich sichtbar synchronisieren und das Gesamtbild periodisch machen. */
  var COUNT_CYCLE = [17, 19, 13, 23, 16, 22, 14, 15];

  var LANGS = ["de", "en", "sr"];
  var BASE_SPEED = 42;   /* CSS-Pixel pro Sekunde fuer Tempo-Faktor 1.0 */
  var TOP_SIZE_BOOST = 1.30;
  var TOP_ALPHA_BOOST = 0.15;

  /* Anteil der nutzbaren Banddicke, ueber den die Bahnen verteilt werden
     (entspricht dem t-Bereich 0.10 bis 0.90) — sonst reiten die aeusseren
     Bahnen auf der Glow-Kante statt im Band. */
  var LANE_SPAN = 0.74;

  /* Anteil des Bahnabstands, den ein Wort mittlerer Groesse einnimmt.
     Zusammen mit SIZE_CYCLE (max 1.25) und TOP_SIZE_BOOST (1.30) bleibt das
     groesste Wort bei ~0.90 des Abstands — die Bahnen beruehren sich also
     gerade eben, wie im Vorbild, ohne ineinander zu laufen. */
  var FONT_OF_GAP = 0.55;

  /* Obergrenze fuer die Spreizung der Bahnen, als Vielfaches der medianen
     Banddicke. Links faechert das Band auf 696 Einheiten auf (Faktor ~2.7);
     ohne Deckel laufen die Bahnen dort fast senkrecht auseinander und der Text
     wird zu einem unleserlichen Gewirr. Gedeckelt bleiben die Woerter im hellen
     Kern, waehrend das BILD unveraendert weiter auffaechert. */
  var MAX_SPREAD = 1.45;

  /* Inline-Fallbacks, damit die Demo auch unter file:// laeuft (fetch schlaegt
     dort fehl). Deckungsgleich mit data/donau-band-edges.json bzw.
     data/hero-flow-terms.json. */
  var FALLBACK_EDGES = [
    [0, 396.5, 1092.5], [40, 357.1, 1034.6], [80, 305.8, 938.4], [120, 254.6, 831.6],
    [160, 208.6, 722.9], [200, 168.0, 586.8], [240, 135.4, 474.3], [280, 110.8, 408.4],
    [320, 91.8, 347.8], [360, 77.4, 297.0], [400, 66.8, 263.3], [440, 59.7, 243.8],
    [480, 56.7, 235.5], [520, 57.8, 237.0], [560, 62.7, 248.9], [600, 72.5, 273.2],
    [640, 87.8, 316.0], [680, 107.9, 381.6], [720, 133.6, 451.6], [760, 166.6, 509.0],
    [800, 208.2, 554.6], [840, 260.1, 588.8], [880, 321.0, 612.4], [920, 365.8, 626.9],
    [960, 380.5, 633.3], [1000, 376.3, 632.9], [1040, 356.2, 625.7], [1080, 323.5, 609.5],
    [1120, 287.6, 580.5], [1160, 251.5, 538.2], [1200, 219.6, 493.8], [1240, 195.7, 452.0],
    [1280, 182.4, 419.6], [1320, 179.5, 408.0], [1360, 185.3, 414.0], [1400, 196.5, 426.1],
    [1440, 209.9, 439.8], [1480, 223.4, 453.3], [1520, 236.9, 466.5], [1560, 250.4, 479.6],
    [1600, 263.6, 492.7], [1640, 276.0, 505.7], [1680, 287.3, 517.0], [1720, 296.1, 526.0],
    [1760, 299.0, 530.8], [1800, 290.6, 528.9], [1840, 264.2, 516.9], [1880, 228.9, 496.0],
    [1919, 213.4, 477.7]
  ];

  var FALLBACK_TOP = [
    { de: "Donau", en: "Danube", sr: "Дунав" },
    { de: "Zukunft", en: "Future", sr: "Будућност" },
    { de: "Verbindung", en: "Connection", sr: "Веза" },
    { de: "Innovation", en: "Innovation", sr: "Иновација" },
    { de: "Partnerschaft", en: "Partnership", sr: "Партнерство" }
  ];

  var FALLBACK_TERMS = [
    { de: "Österreich", en: "Austria", sr: "Аустрија" },
    { de: "Spielraum", en: "Room to Play", sr: "Простор за игру" },
    { de: "Serbien", en: "Serbia", sr: "Србија" },
    { de: "Europa", en: "Europe", sr: "Европа" },
    { de: "Diaspora", en: "Diaspora", sr: "Дијаспора" },
    { de: "Begegnung", en: "Encounter", sr: "Сусрет" },
    { de: "Wirtschaft", en: "Economy", sr: "Привреда" },
    { de: "Industrie", en: "Industry", sr: "Индустрија" },
    { de: "Forschung", en: "Research", sr: "Истраживање" },
    { de: "Bildung", en: "Education", sr: "Образовање" },
    { de: "Unternehmertum", en: "Entrepreneurship", sr: "Предузетништво" },
    { de: "Kreativität", en: "Creativity", sr: "Креативност" },
    { de: "Kultur", en: "Culture", sr: "Култура" },
    { de: "Musik", en: "Music", sr: "Музика" },
    { de: "Sport", en: "Sport", sr: "Спорт" },
    { de: "Lebensqualität", en: "Quality of Life", sr: "Квалитет живота" },
    { de: "Nachhaltigkeit", en: "Sustainability", sr: "Одрживост" },
    { de: "Offenheit", en: "Openness", sr: "Отвореност" },
    { de: "Teilhabe", en: "Participation", sr: "Учешће" }
  ];

  var edges = FALLBACK_EDGES;
  var topTerms = FALLBACK_TOP;
  var terms = FALLBACK_TERMS;
  var uidCounter = 0;

  /* ------------------------------------------------------------------ */
  /* Hilfsfunktionen                                                     */
  /* ------------------------------------------------------------------ */

  /* Seeded PRNG (mulberry32). Wird nur beim EINMALIGEN Aufbau der Wortliste
     benutzt; die Stile werden danach in lane.words gespeichert und bei jeder
     Wiederholung identisch gerendert. Waeren die Stile pro Wiederholung neu
     ausgewuerfelt, saehe die zweite Kopie anders aus als die erste und der
     Loop wuerde sichtbar springen — trotz korrekter Laengenrechnung. */
  function rng(seed) {
    var a = seed >>> 0;
    return function () {
      a = (a + 0x6D2B79F5) >>> 0;
      var t = a;
      t = Math.imul(t ^ (t >>> 15), t | 1);
      t ^= t + Math.imul(t ^ (t >>> 7), t | 61);
      return ((t ^ (t >>> 14)) >>> 0) / 4294967296;
    };
  }

  function clamp(v, lo, hi) { return v < lo ? lo : (v > hi ? hi : v); }

  /* Helligkeit des Untergrunds an der Bahnposition t, linear zwischen den
     Stuetzstellen von LANE_LUMA interpoliert. */
  function lumaAtT(t) {
    var n = LANE_LUMA.length;
    var f = clamp((t - LUMA_T0) / (LUMA_T1 - LUMA_T0), 0, 1) * (n - 1);
    var i = Math.floor(f);
    if (i >= n - 1) return LANE_LUMA[n - 1];
    return LANE_LUMA[i] + (f - i) * (LANE_LUMA[i + 1] - LANE_LUMA[i]);
  }

  /* Bahnen ueber hellem Untergrund brauchen dunkle Schrift, sonst ueberstrahlt
     das Band den Text.

     Warum nur die UNTERE Haelfte, obwohl der obere Rand aehnlich hell misst:
     oben ist das Band deutlich fleckiger — 30 % der Strecke liegen dort unter
     Luma 160, unten nur 19 %. Helle Schrift traegt oben also zuverlaessig,
     unten praktisch nirgends.

     Weil t aus der Bahnanzahl folgt, greift die Regel automatisch fuer die
     jeweils untersten Bahnen — unabhaengig davon, wie viele es bei der
     aktuellen Fensterbreite gerade sind. */
  function isBrightLane(t) {
    return t > 0.5 && lumaAtT(t) >= BRIGHT_LUMA;
  }

  /* Ober-/Unterkante an beliebigem x: linear zwischen den Stuetzstellen
     interpoliert, ausserhalb der Daten aus dem Randsegment extrapoliert
     (dafuer sorgt der Ueberstand links/rechts). */
  function edgeAt(x) {
    var n = edges.length;
    if (x <= edges[0][0]) {
      var f0 = (x - edges[0][0]) / (edges[1][0] - edges[0][0]);
      return [edges[0][1] + f0 * (edges[1][1] - edges[0][1]),
              edges[0][2] + f0 * (edges[1][2] - edges[0][2])];
    }
    if (x >= edges[n - 1][0]) {
      var f1 = (x - edges[n - 2][0]) / (edges[n - 1][0] - edges[n - 2][0]);
      return [edges[n - 2][1] + f1 * (edges[n - 1][1] - edges[n - 2][1]),
              edges[n - 2][2] + f1 * (edges[n - 1][2] - edges[n - 2][2])];
    }
    for (var i = 0; i < n - 1; i++) {
      if (x >= edges[i][0] && x <= edges[i + 1][0]) {
        var f = (x - edges[i][0]) / (edges[i + 1][0] - edges[i][0]);
        return [edges[i][1] + f * (edges[i + 1][1] - edges[i][1]),
                edges[i][2] + f * (edges[i + 1][2] - edges[i][2])];
      }
    }
    return [edges[0][1], edges[0][2]];
  }

  /* y-Wert einer Bahn an der Stelle x. Die Spreizung wird auf maxSpread
     gedeckelt (siehe MAX_SPREAD): ist das Band breiter, wird der gedeckelte
     Bereich auf der Bandmitte zentriert. Das Bild bleibt davon unberuehrt —
     nur die Textbahnen halten sich im hellen Kern. */
  function laneY(x, t, maxSpread) {
    var e = edgeAt(x);
    var top = e[0], bot = e[1];
    var thickness = bot - top;
    if (maxSpread > 0 && thickness > maxSpread) {
      var mid = (top + bot) / 2;
      top = mid - maxSpread / 2;
      bot = mid + maxSpread / 2;
    }
    return top + t * (bot - top);
  }

  /* Bahnpfad fuer Parameter t (0 = Oberkante, 1 = Unterkante) ueber den
     Bereich [x0, x1]. Geglaettet ueber quadratische Kurven durch die
     Mittelpunkte (gleiche Technik wie expo27-textflow.js) — ohne diese
     C1-Stetigkeit knicken die Glyphen an den Stuetzstellen sichtbar.

     Der Bereich wird bewusst nur ueber den sichtbaren Ausschnitt plus
     Ueberstand gebaut, nicht ueber das ganze Bild: die Glyphenzahl pro Frame
     haengt an der Pfadlaenge, und mobil waere der unsichtbare Rest reine
     Rechenlast auf dem schwaechsten Geraet. */
  function buildLanePath(t, x0, x1, maxSpread) {
    var step = 36;
    var pts = [];
    for (var x = x0; x <= x1; x += step) {
      pts.push([x, laneY(x, t, maxSpread)]);
    }
    pts.push([x1, laneY(x1, t, maxSpread)]);

    var d = "M " + pts[0][0].toFixed(1) + " " + pts[0][1].toFixed(1);
    for (var i = 1; i < pts.length - 1; i++) {
      var mx = (pts[i][0] + pts[i + 1][0]) / 2;
      var my = (pts[i][1] + pts[i + 1][1]) / 2;
      d += " Q " + pts[i][0].toFixed(1) + " " + pts[i][1].toFixed(1) +
        " " + mx.toFixed(1) + " " + my.toFixed(1);
    }
    var last = pts[pts.length - 1];
    d += " L " + last[0].toFixed(1) + " " + last[1].toFixed(1);
    return d;
  }

  /* Mediane Banddicke im sichtbaren Ausschnitt — Grundlage fuer die
     Bahnanzahl. Bewusst der Median und nicht das Minimum: am Wellenkamm ist
     das Band mit ~179 Einheiten am duennsten, dort duerfen die Bahnen enger
     zusammenruecken, das entspricht dem Original. */
  function medianThickness(x0, x1) {
    var vals = [];
    for (var i = 0; i < edges.length; i++) {
      if (edges[i][0] >= x0 && edges[i][0] <= x1) vals.push(edges[i][2] - edges[i][1]);
    }
    if (!vals.length) return 240;
    vals.sort(function (a, b) { return a - b; });
    return vals[Math.floor(vals.length / 2)];
  }

  function pickView(width) {
    for (var i = 0; i < VIEWS.length; i++) {
      if (width >= VIEWS[i].min) return VIEWS[i];
    }
    return VIEWS[VIEWS.length - 1];
  }

  /* ------------------------------------------------------------------ */
  /* Wortliste einer Bahn                                                */
  /* ------------------------------------------------------------------ */

  /* Pool: Top-Begriffe dreifach (sie sollen oefter vorkommen), uebrige
     einfach. Sprache rotiert (de -> en -> sr) mit bahnabhaengigem Startversatz,
     damit Kyrillisch nicht spaltenweise untereinander steht; die Reihenfolge
     der Begriffe selbst wird gemischt.

     Rueckgabe: Array aus { text, size, alpha, cls } — EINMAL berechnet und
     danach unveraendert, damit jede Wiederholung identisch aussieht. */
  function buildWords(laneIndex, count, allowDark, brightLane) {
    var rand = rng(0x9E37 + laneIndex * 7919);
    var pool = [];
    var i, k;
    for (k = 0; k < 3; k++) {
      for (i = 0; i < topTerms.length; i++) pool.push({ t: topTerms[i], top: true });
    }
    for (i = 0; i < terms.length; i++) pool.push({ t: terms[i], top: false });

    /* Fisher-Yates */
    for (i = pool.length - 1; i > 0; i--) {
      var j = Math.floor(rand() * (i + 1));
      var tmp = pool[i]; pool[i] = pool[j]; pool[j] = tmp;
    }

    var out = [];
    for (i = 0; i < count; i++) {
      var entry = pool[i % pool.length];
      var lang = LANGS[(i + laneIndex) % LANGS.length];
      var text = entry.t[lang] || entry.t.de;
      var size = 1 + (rand() - 0.5) * 0.30;          /* +/- 15 % */
      var alpha = (rand() - 0.5) * 0.12;             /* +/- 0.06 */
      if (entry.top) { size *= TOP_SIZE_BOOST; alpha += TOP_ALPHA_BOOST; }

      var ci, isDark;
      if (brightLane) {
        /* Untergrund fast durchgehend hell: die ganze Bahn dunkel setzen. */
        ci = DARK_COLOR_CYCLE[(i + laneIndex) % DARK_COLOR_CYCLE.length];
        isDark = true;
      } else {
        /* Dunkles Navy (Index 5) nur auf den mittleren Bahnen: dort liegt der
           hellweisse Kern des Bandes, in dem sich das Wort als Aussparung
           liest. Auf den Randbahnen ausserhalb der hellen Zone liegt nur noch
           Glow — ein dunkles Wort wuerde dort im Hintergrund verschwinden. */
        ci = COLOR_CYCLE[(i + laneIndex) % COLOR_CYCLE.length];
        if (ci === 5 && !allowDark) ci = 1;
        isDark = ci === 5;
      }

      out.push({
        text: text,
        size: size,
        alpha: alpha,
        cls: "hf-c" + ci,
        dark: isDark,
        top: entry.top
      });
    }

    /* Dedupe: "Innovation", "Diaspora" und "Sport" sind in de und en identisch
       und koennen durch die Sprachrotation direkt hintereinander landen. */
    for (i = 1; i < out.length; i++) {
      if (out[i].text === out[i - 1].text) {
        var swap = (i + 2) % out.length;
        var t2 = out[i]; out[i] = out[swap]; out[swap] = t2;
      }
    }
    return out;
  }

  /* ------------------------------------------------------------------ */
  /* Komponente                                                          */
  /* ------------------------------------------------------------------ */

  function HeroFlow(container, options) {
    this.container = container;
    this.opts = Object.assign({ opacityScale: 1 }, options || {});
    this.lanes = [];
    this.running = false;
    this._raf = null;
    this._last = 0;
    this.view = null;
    this.laneCount = 0;

    container.setAttribute("aria-hidden", "true");
    container.classList.add("hero-flow");

    this._build();

    this._onResize = this._debounce(this._onResizeNow.bind(this), 160);
    if ("ResizeObserver" in window) {
      this._ro = new ResizeObserver(this._onResize);
      this._ro.observe(container);
    } else {
      window.addEventListener("resize", this._onResize);
    }

    var self = this;
    if (document.fonts && document.fonts.ready) {
      /* getComputedTextLength() vor fonts.ready liefert falsche Sequenz-
         laengen — der haeufigste Fehler in dieser Bauart, sichtbar als
         Sprung im Loop. Nach dem Font-Swap einmal nachmessen. */
      document.fonts.ready.then(function () { self._reflow(); });
    }

    if ("IntersectionObserver" in window) {
      this._io = new IntersectionObserver(function (entries) {
        entries.forEach(function (e) {
          if (e.isIntersecting) self.start(); else self.stop();
        });
      }, { threshold: 0.01 });
      this._io.observe(container);
    }

    if (REDUCE_MOTION) this._freeze();
    else this.start();
  }

  HeroFlow.prototype._debounce = function (fn, ms) {
    var t;
    return function () { clearTimeout(t); t = setTimeout(fn, ms); };
  };

  /* Aktuelle Geometrie ermitteln: Ausschnitt, Skalierung, Bahnanzahl.
     scale ist der Schluessel — 1 viewBox-Einheit entspricht scale CSS-Pixeln.
     Alles, was in CSS-Pixeln gedacht wird (Schriftgroesse, Tempo), muss durch
     scale geteilt werden. */
  HeroFlow.prototype._geometry = function () {
    /* Beim Mount ist der Container u.U. noch nicht ausgemessen (Breite 0).
       Ohne Rueckfall auf die Fensterbreite wuerde dann der Mobile-Ausschnitt
       gewaehlt und gleich darauf vom ResizeObserver wieder verworfen — ein
       sichtbarer Fehlaufbau. */
    var w = this.container.getBoundingClientRect().width;
    if (!w || w < 1) w = document.documentElement.clientWidth || 1280;
    w = Math.max(280, w);

    var view = pickView(w);
    var box = view.box;
    var scale = w / box[2];
    var thicknessVB = medianThickness(box[0], box[0] + box[2]);

    /* Wie viele Bahnen der angestrebten Schriftgroesse passen in die
       gerenderte Banddicke? Ein Wort belegt FONT_OF_GAP des Bahnabstands,
       also braucht es font / FONT_OF_GAP CSS-Pixel Abstand. */
    var gapNeeded = view.font / FONT_OF_GAP;
    var n = 1 + Math.floor((thicknessVB * scale * LANE_SPAN) / gapNeeded);
    n = clamp(n, view.minLanes, view.maxLanes);
    return {
      view: view, scale: scale, laneCount: n, width: w,
      thicknessVB: thicknessVB,
      maxSpread: thicknessVB * MAX_SPREAD
    };
  };

  HeroFlow.prototype._build = function () {
    var g = this._geometry();
    this.view = g.view;
    this.scale = g.scale;
    this.laneCount = g.laneCount;
    this.thicknessVB = g.thicknessVB;

    var box = g.view.box;
    var overshoot = box[2] * 0.10;
    var x0 = box[0] - overshoot;
    var x1 = box[0] + box[2] + overshoot;

    var svg = document.createElementNS(SVGNS, "svg");
    svg.setAttribute("viewBox", box.join(" "));
    svg.setAttribute("preserveAspectRatio", "xMidYMid slice");
    this.svg = svg;

    var image = document.createElementNS(SVGNS, "image");
    image.setAttributeNS("http://www.w3.org/1999/xlink", "xlink:href", IMG);
    image.setAttribute("href", IMG);
    image.setAttribute("x", "0");
    image.setAttribute("y", "0");
    image.setAttribute("width", SRC_W);
    image.setAttribute("height", SRC_H);
    svg.appendChild(image);

    var defs = document.createElementNS(SVGNS, "defs");
    svg.appendChild(defs);

    var n = this.laneCount;
    for (var k = 0; k < n; k++) {
      var t = n > 1 ? (1 - LANE_SPAN) / 2 + LANE_SPAN * (k / (n - 1)) : 0.5;
      var uid = "hf-path-" + (uidCounter++);

      var path = document.createElementNS(SVGNS, "path");
      path.setAttribute("id", uid);
      path.setAttribute("d", buildLanePath(t, x0, x1, g.maxSpread));
      path.setAttribute("fill", "none");
      defs.appendChild(path);

      var text = document.createElementNS(SVGNS, "text");
      var tp = document.createElementNS(SVGNS, "textPath");
      tp.setAttributeNS("http://www.w3.org/1999/xlink", "xlink:href", "#" + uid);
      tp.setAttribute("href", "#" + uid);
      tp.setAttribute("startOffset", "0");
      text.appendChild(tp);
      svg.appendChild(text);

      this.lanes.push({
        index: k,
        path: path, text: text, tp: tp,
        words: buildWords(k, COUNT_CYCLE[k % COUNT_CYCLE.length],
          t >= 0.28 && t <= 0.72, isBrightLane(t)),
        sizeF: SIZE_CYCLE[k % SIZE_CYCLE.length],
        speedF: SPEED_CYCLE[k % SPEED_CYCLE.length],
        alpha: ALPHA_CYCLE[k % ALPHA_CYCLE.length],
        offset: -k * 140,
        seqLen: 0, pathLen: 0
      });
    }

    this.container.appendChild(svg);
    this._reflow();
  };

  /* Schriftgroessen und Sequenzen an die aktuelle Skalierung anpassen.
     Wird auch bei reiner Breitenaenderung innerhalb eines Breakpoints
     gebraucht: die effektive Schriftgroesse in CSS-Pixeln ist
     fontVB * scale — ohne Gegenrechnung wuerde der Text am Handy
     mikroskopisch. */
  HeroFlow.prototype._reflow = function () {
    var self = this;

    /* Die Schriftgroesse haengt am Bahnabstand, nicht an einem absoluten
       CSS-Pixel-Wert: nur so bleibt das Verhaeltnis Schrift : Band bei jeder
       Bahnzahl und jedem Ausschnitt stimmig. Die Lesbarkeitsgrenze in CSS-
       Pixeln greift bereits ueber die Bahnanzahl (siehe _geometry). */
    var n = this.lanes.length;
    var gapVB = (this.thicknessVB * LANE_SPAN) / Math.max(1, n - 1);
    var baseVB = gapVB * FONT_OF_GAP;

    this.lanes.forEach(function (lane) {
      var fontVB = baseVB * lane.sizeF;
      lane.fontVB = fontVB;
      lane.text.style.fontSize = fontVB.toFixed(2) + "px";

      try { lane.pathLen = lane.path.getTotalLength(); }
      catch (e) { lane.pathLen = self.view.box[2]; }

      self._renderLane(lane);
    });
    this._apply();
  };

  /* Eine Wiederholung der Wortliste als Fragment bauen, messen, dann so oft
     klonen, bis Textlaenge >= Pfadlaenge + eine Sequenz. Geklont statt neu
     gewuerfelt — das garantiert identische Wiederholungen und damit den
     nahtlosen Loop. */
  HeroFlow.prototype._renderLane = function (lane) {
    var tp = lane.tp;
    while (tp.firstChild) tp.removeChild(tp.firstChild);

    var frag = document.createDocumentFragment();
    for (var i = 0; i < lane.words.length; i++) {
      var w = lane.words[i];
      var span = document.createElementNS(SVGNS, "tspan");
      span.setAttribute("class", w.cls);
      span.setAttribute("font-size", (lane.fontVB * w.size).toFixed(2));
      /* Dunkle Woerter leben von Kontrast, nicht von Leuchtkraft — sie
         brauchen volle Deckkraft, sonst verwaschen sie im hellen Kern. */
      var op = w.dark ? 0.88 + w.alpha : (lane.alpha + w.alpha);
      span.setAttribute("opacity", clamp(op * this.opts.opacityScale, 0.08, 1).toFixed(3));
      span.textContent = w.text + SEP;
      frag.appendChild(span);
    }
    var template = frag.cloneNode(true);
    tp.appendChild(frag);

    var oneLen = 0;
    try { oneLen = tp.getComputedTextLength(); } catch (e) { oneLen = 0; }

    if (!oneLen || !isFinite(oneLen)) {
      /* Font/Layout noch nicht bereit — mit drei Kopien weiterlaufen und
         beim naechsten _reflow() (nach fonts.ready) sauber nachmessen. */
      tp.appendChild(template.cloneNode(true));
      tp.appendChild(template.cloneNode(true));
      lane.seqLen = lane.pathLen;
      return;
    }

    lane.seqLen = oneLen;
    var reps = Math.max(2, Math.ceil((lane.pathLen + oneLen) / oneLen));
    for (var r = 1; r < reps; r++) tp.appendChild(template.cloneNode(true));
  };

  HeroFlow.prototype._apply = function () {
    for (var i = 0; i < this.lanes.length; i++) {
      var lane = this.lanes[i];
      lane.tp.setAttribute("startOffset", lane.offset.toFixed(1));
    }
  };

  /* Standbild fuer prefers-reduced-motion: Bahnen versetzt einfrieren. */
  HeroFlow.prototype._freeze = function () {
    for (var i = 0; i < this.lanes.length; i++) {
      this.lanes[i].offset = -i * 160 - 80;
    }
    this._apply();
  };

  /* Voller Neuaufbau nur, wenn sich Ausschnitt oder Bahnanzahl aendern —
     sonst reicht _reflow(). Wuerde bei jedem Resize-Event alles neu gebaut,
     ruckelt jedes Fensterziehen. */
  HeroFlow.prototype._onResizeNow = function () {
    var g = this._geometry();
    if (g.view === this.view && g.laneCount === this.laneCount) {
      this.scale = g.scale;
      this._reflow();
      if (REDUCE_MOTION) this._freeze();
      return;
    }
    this._rebuild();
  };

  /* Nur das eigene SVG entfernen, nicht den Container leeren: der Container
     darf weitere Kinder tragen (z.B. Overlays), die einen Rebuild ueberleben
     muessen. */
  HeroFlow.prototype._rebuild = function () {
    if (this.svg && this.svg.parentNode === this.container) {
      this.container.removeChild(this.svg);
    }
    this.svg = null;
    this.lanes = [];
    this._build();
    if (REDUCE_MOTION) this._freeze();
  };

  HeroFlow.prototype.start = function () {
    if (this.running || REDUCE_MOTION) return;
    this.running = true;
    this._last = 0;
    var self = this;
    this._frame = function (ts) {
      if (!self.running) return;
      if (!self._last) self._last = ts;
      var dt = Math.min(0.05, (ts - self._last) / 1000);
      self._last = ts;
      for (var i = 0; i < self.lanes.length; i++) {
        var lane = self.lanes[i];
        /* Tempo in CSS-Pixeln/s gedacht, deshalb durch scale geteilt —
           sonst wirkt die Animation auf kleinen Ausschnitten traege. */
        lane.offset += (BASE_SPEED * lane.speedF / self.scale) * dt;
        if (lane.seqLen > 0 && lane.offset >= 0) lane.offset -= lane.seqLen;
      }
      self._apply();
      self._raf = requestAnimationFrame(self._frame);
    };
    this._raf = requestAnimationFrame(this._frame);
  };

  HeroFlow.prototype.stop = function () {
    this.running = false;
    if (this._raf) { cancelAnimationFrame(this._raf); this._raf = null; }
    this._last = 0;
  };

  HeroFlow.prototype.destroy = function () {
    this.stop();
    if (this._ro) this._ro.disconnect();
    else window.removeEventListener("resize", this._onResize);
    if (this._io) this._io.disconnect();
    if (this.svg && this.svg.parentNode === this.container) {
      this.container.removeChild(this.svg);
    }
    this.svg = null;
    this.lanes = [];
  };

  /* ------------------------------------------------------------------ */
  /* Daten nachladen + Public API                                        */
  /* ------------------------------------------------------------------ */

  var instances = [];

  function loadData() {
    var script = document.currentScript;
    var edgesUrl = script && script.src
      ? new URL("data/donau-band-edges.json", script.src).toString()
      : "data/donau-band-edges.json";
    var termsUrl = script && script.src
      ? new URL("data/hero-flow-terms.json", script.src).toString()
      : "data/hero-flow-terms.json";

    var jobs = [
      fetch(edgesUrl, { cache: "no-cache" })
        .then(function (r) { return r.ok ? r.json() : null; })
        .then(function (d) { if (d && d.edges && d.edges.length > 4) edges = d.edges; })
        .catch(function () { /* Fallback bleibt aktiv */ }),
      fetch(termsUrl, { cache: "no-cache" })
        .then(function (r) { return r.ok ? r.json() : null; })
        .then(function (d) {
          if (d && d.top && d.terms) { topTerms = d.top; terms = d.terms; }
        })
        .catch(function () { /* Fallback bleibt aktiv */ })
    ];
    try {
      Promise.all(jobs).then(function () {
        instances.forEach(function (inst) { if (inst) inst._rebuild(); });
      });
    } catch (e) { /* Fallback bleibt aktiv */ }
  }

  window.ExpoHeroFlow = {
    mount: function (container, options) {
      if (!container) return null;
      var inst = new HeroFlow(container, options);
      instances.push(inst);
      return inst;
    },
    setTheme: function () { /* no-op: Farben laufen ueber CSS-Tokens */ }
  };

  function autoMountHeroFlow() {
    var container = document.getElementById("hero-wortfluss") || document.querySelector(".hero-flow");
    if (!container || container.__expoHeroFlowMounted) return;
    container.__expoHeroFlowMounted = true;
    window.ExpoHeroFlow.mount(container);
  }

  loadData();
  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", autoMountHeroFlow);
  } else {
    autoMountHeroFlow();
  }
})();
