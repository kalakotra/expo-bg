/**
 * expo27-textflow.js
 * Textband „Fluss an Informationen": mehrere Wellenbahnen, in denen Begriffe
 * (BMWET-Pressemeldung, Themencluster, Claim) von links nach rechts fliessen
 * und dabei — gebogen — der Wellenlinie ihrer Bahn folgen (SVG <textPath>).
 *
 * Jede Bahn hat eigene Amplitude, Frequenz, Phase, Geschwindigkeit und
 * Transparenz; die Bahnen ueberlappen sich leicht. Links weiches Erscheinen,
 * rechts weiches Verschwinden ueber eine CSS-mask (siehe .text-flow).
 *
 * API (analog ExpoFlow / ExpoRipple):
 *   window.ExpoTextFlow.mount(container, options) -> instance
 *   window.ExpoTextFlow.setTheme(t)   // Farbe laeuft primaer ueber CSS-Token
 *   instance: { start(), stop(), destroy() }
 *
 * Dekorativ: der Container ist aria-hidden; alle Fakten stehen regulaer im
 * Seiteninhalt. Respektiert prefers-reduced-motion (Standbild statt Loop).
 */
(function () {
  "use strict";

  var REDUCE_MOTION = window.matchMedia("(prefers-reduced-motion: reduce)").matches;
  var SVGNS = "http://www.w3.org/2000/svg";
  var SEP = " · "; // em space · em space

  /* Inline-Fallback, falls das JSON nicht geladen werden kann (z.B. file://).
     Deckungsgleich mit demo/data/textflow-terms.json. */
  var FALLBACK_GROUPS = {
    claim: ["JOIN THE FLOW", "Play for Humanity", "Sport and Music for All", "Austria"],
    facts: ["150 Nationen", "4,1 Mio Besucher:innen", "93 Tage", "800+ Unternehmen",
      "3. größter Investor", "2,2 Mrd € Exporte", "15. Mai – 15. Aug 2027"],
    cluster: ["Explore Austria", "In the Heart of Europe", "Industry & Innovation",
      "Nature & Sustainability", "Sports & Society", "Partner of the Region",
      "Innovation Lab", "The Bridge"],
    values: ["Flow", "Culture", "Economy", "Create", "Innovations", "Bridging Regions",
      "Play Together", "Power of Play", "Play for Progress"],
    connection: ["Wien → Belgrad", "Donau", "Westbalkan", "Zukunftsmärkte",
      "EU-Integration", "Partnerschaft", "Nachbarschaft"]
  };

  /* Serbisch-kyrillische Fassungen (keyed auf den Quellbegriff). Deckungsgleich
     mit dem "sr"-Block in demo/data/textflow-terms.json. Ca. jedes 4. Element
     wird kyrillisch gezeigt (siehe buildSequence), um den Serbien-Bezug sichtbar
     zu machen — wie „Придружи се току" im Logo. */
  var FALLBACK_SR = {
    "JOIN THE FLOW": "Придружи се току", "Play for Humanity": "Игра за човечанство",
    "Sport and Music for All": "Спорт и музика за све", "Austria": "Аустрија",
    "150 Nationen": "150 нација", "4,1 Mio Besucher:innen": "4,1 мил. посетилаца",
    "93 Tage": "93 дана", "800+ Unternehmen": "800+ компанија",
    "3. größter Investor": "3. највећи инвеститор", "2,2 Mrd € Exporte": "2,2 млрд € извоза",
    "15. Mai – 15. Aug 2027": "15. мај – 15. авг 2027",
    "Explore Austria": "Истражи Аустрију", "In the Heart of Europe": "У срцу Европе",
    "Industry & Innovation": "Индустрија и иновације", "Nature & Sustainability": "Природа и одрживост",
    "Sports & Society": "Спорт и друштво", "Partner of the Region": "Партнер региона",
    "Innovation Lab": "Лаб за иновације", "The Bridge": "Мост",
    "Flow": "Ток", "Culture": "Култура", "Economy": "Привреда", "Create": "Стварај",
    "Innovations": "Иновације", "Bridging Regions": "Повезивање региона",
    "Play Together": "Играјмо заједно", "Power of Play": "Снага игре",
    "Play for Progress": "Игра за напредак",
    "Wien → Belgrad": "Беч → Београд", "Donau": "Дунав", "Westbalkan": "Западни Балкан",
    "Zukunftsmärkte": "Тржишта будућности", "EU-Integration": "ЕУ интеграција",
    "Partnerschaft": "Партнерство", "Nachbarschaft": "Суседство"
  };

  /* Bahn-Konfiguration (Startwerte laut Plan). vy = vertikaler Offset im
     Band (px), amp/freq/phase formen die Sinuslinie, speed in px/s. */
  var LANES = [
    { fontSize: 30, amp: 22, freq: 1.2, phase: 0.0,        speed: 60, opacity: 0.22, vy: 0,  mix: ["claim", "values"] },
    { fontSize: 18, amp: 34, freq: 1.8, phase: 1.3,        speed: 38, opacity: 0.16, vy: 24, mix: ["facts", "connection"] },
    { fontSize: 24, amp: 28, freq: 0.9, phase: Math.PI / 2, speed: 48, opacity: 0.18, vy: 48, mix: ["cluster"] },
    { fontSize: 14, amp: 40, freq: 2.3, phase: 2.6,        speed: 30, opacity: 0.12, vy: 72, mix: ["values", "facts"] },
    { fontSize: 20, amp: 18, freq: 1.5, phase: Math.PI,    speed: 72, opacity: 0.14, vy: 36, mix: ["connection", "claim"] }
  ];

  var termGroups = FALLBACK_GROUPS;
  var srTerms = FALLBACK_SR;
  var uidCounter = 0;

  /* Fisher-Yates auf einer Kopie */
  function shuffled(arr) {
    var a = arr.slice();
    for (var i = a.length - 1; i > 0; i--) {
      var j = Math.floor(Math.random() * (i + 1));
      var t = a[i]; a[i] = a[j]; a[j] = t;
    }
    return a;
  }

  /* Begriffssequenz einer Bahn aus ihren Mix-Gruppen zusammensetzen. Ca. jedes
     4. Element wird durch seine serbisch-kyrillische Fassung ersetzt (sofern
     vorhanden) — macht den Serbien-Bezug im Fluss sichtbar. Die Phase variiert
     pro Bahn, damit die Cyrillic-Begriffe nicht in einer Spalte untereinander
     stehen. Latein rendert in TroisMille, Cyrillic faellt per Glyph-Fallback
     auf einen sauberen Sans (siehe .text-flow text im CSS). */
  function buildSequence(mix) {
    var terms = [];
    mix.forEach(function (g) {
      if (termGroups[g]) terms = terms.concat(termGroups[g]);
    });
    if (!terms.length) terms = FALLBACK_GROUPS.claim.slice();
    var seq = shuffled(terms);
    var phase = Math.floor(Math.random() * 4);
    for (var i = 0; i < seq.length; i++) {
      if ((i + phase) % 4 === 3 && srTerms[seq[i]]) seq[i] = srTerms[seq[i]];
    }
    return seq.join(SEP) + SEP;
  }

  /* Sinuspfad ueber die Breite w, leicht ueber beide Raender hinaus, als
     geglaettete Polyline (quadratische Kurven durch die Mittelpunkte). */
  function buildWavePath(w, h, lane) {
    var overshoot = w * 0.12;
    var x0 = -overshoot, x1 = w + overshoot;
    var midY = h / 2;
    var step = 40;
    function yAt(x) {
      return midY + lane.amp * Math.sin((2 * Math.PI * lane.freq * x) / w + lane.phase);
    }
    var pts = [];
    for (var x = x0; x <= x1; x += step) pts.push([x, yAt(x)]);
    pts.push([x1, yAt(x1)]);

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

  function TextFlow(container, options) {
    this.container = container;
    this.opts = Object.assign({ height: 220, opacityScale: 1 }, options || {});
    this.lanes = [];
    this.running = false;
    this._raf = null;
    this._last = 0;

    container.setAttribute("aria-hidden", "true");
    container.classList.add("text-flow");

    this._build();

    this._onResize = this._debounce(this._rebuild.bind(this), 160);
    if ("ResizeObserver" in window) {
      this._ro = new ResizeObserver(this._onResize);
      this._ro.observe(container);
    } else {
      window.addEventListener("resize", this._onResize);
    }

    var self = this;
    if (document.fonts && document.fonts.ready) {
      document.fonts.ready.then(function () { self._measureAll(); });
    }

    if (REDUCE_MOTION) this._freeze();
    else this.start();
  }

  TextFlow.prototype._debounce = function (fn, ms) {
    var t;
    return function () {
      clearTimeout(t);
      t = setTimeout(fn, ms);
    };
  };

  TextFlow.prototype._build = function () {
    var rect = this.container.getBoundingClientRect();
    this.w = Math.max(320, rect.width);
    this.h = this.opts.height;

    var frag = document.createDocumentFragment();
    var self = this;

    LANES.forEach(function (cfg, idx) {
      var laneH = self.h;
      var svg = document.createElementNS(SVGNS, "svg");
      svg.setAttribute("viewBox", "0 0 " + self.w + " " + laneH);
      svg.setAttribute("width", self.w);
      svg.setAttribute("height", laneH);
      svg.setAttribute("preserveAspectRatio", "xMidYMid meet");
      svg.style.top = cfg.vy + "px";

      var uid = "tf-path-" + (uidCounter++);
      var defs = document.createElementNS(SVGNS, "defs");
      var path = document.createElementNS(SVGNS, "path");
      path.setAttribute("id", uid);
      path.setAttribute("d", buildWavePath(self.w, laneH, cfg));
      path.setAttribute("fill", "none");
      defs.appendChild(path);
      svg.appendChild(defs);

      var text = document.createElementNS(SVGNS, "text");
      text.style.fontSize = cfg.fontSize + "px";
      text.setAttribute("opacity", (cfg.opacity * self.opts.opacityScale).toFixed(3));

      var tp = document.createElementNS(SVGNS, "textPath");
      tp.setAttributeNS("http://www.w3.org/1999/xlink", "xlink:href", "#" + uid);
      tp.setAttribute("href", "#" + uid);
      tp.setAttribute("startOffset", "0");
      var seq = buildSequence(cfg.mix);
      tp.textContent = seq + seq; // zweifach fuer nahtlosen Loop
      text.appendChild(tp);
      svg.appendChild(text);

      frag.appendChild(svg);
      self.lanes.push({
        cfg: cfg, svg: svg, path: path, text: text, tp: tp,
        seq: seq, offset: idx * -120, seqLen: 0, pathLen: 0
      });
    });

    this.container.appendChild(frag);
    this._measureAll();
  };

  /* Sequenz so oft wiederholen, bis Textlaenge >= Pfadlaenge + 1 Sequenz;
     seqLen (Pixellaenge EINER Sequenz) fuer den nahtlosen Reset merken. */
  TextFlow.prototype._measureAll = function () {
    var self = this;
    this.lanes.forEach(function (lane) {
      try {
        lane.pathLen = lane.path.getTotalLength();
      } catch (e) { lane.pathLen = self.w; }

      lane.tp.textContent = lane.seq;
      var oneLen;
      try { oneLen = lane.tp.getComputedTextLength(); } catch (e) { oneLen = 0; }
      if (!oneLen || !isFinite(oneLen)) {
        // Font/Layout noch nicht bereit — mit Doppelsequenz weiterlaufen
        lane.tp.textContent = lane.seq + lane.seq;
        lane.seqLen = lane.pathLen;
        return;
      }
      lane.seqLen = oneLen;

      var target = lane.pathLen + oneLen;
      var reps = Math.max(2, Math.ceil(target / oneLen));
      var full = "";
      for (var i = 0; i < reps; i++) full += lane.seq;
      lane.tp.textContent = full;
    });
  };

  TextFlow.prototype._rebuild = function () {
    // komplette Bahnen neu aufbauen (Breite/Pfad haengen an der Containerbreite)
    while (this.container.firstChild) this.container.removeChild(this.container.firstChild);
    this.lanes = [];
    this._build();
    if (REDUCE_MOTION) this._freeze();
  };

  TextFlow.prototype._apply = function () {
    for (var i = 0; i < this.lanes.length; i++) {
      var lane = this.lanes[i];
      lane.tp.setAttribute("startOffset", lane.offset.toFixed(1));
    }
  };

  /* Standbild fuer prefers-reduced-motion: Bahnen versetzt einfrieren. */
  TextFlow.prototype._freeze = function () {
    for (var i = 0; i < this.lanes.length; i++) {
      this.lanes[i].offset = -i * 90;
    }
    this._apply();
  };

  TextFlow.prototype.start = function () {
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
        lane.offset += lane.cfg.speed * dt; // Fluss von links nach rechts
        if (lane.seqLen > 0 && lane.offset >= 0) {
          lane.offset -= lane.seqLen; // nahtloser Sprung (identischer Inhalt)
        }
      }
      self._apply();
      self._raf = requestAnimationFrame(self._frame);
    };
    this._raf = requestAnimationFrame(this._frame);
  };

  TextFlow.prototype.stop = function () {
    this.running = false;
    if (this._raf) { cancelAnimationFrame(this._raf); this._raf = null; }
    this._last = 0;
  };

  TextFlow.prototype.destroy = function () {
    this.stop();
    if (this._ro) this._ro.disconnect();
    else window.removeEventListener("resize", this._onResize);
    while (this.container.firstChild) this.container.removeChild(this.container.firstChild);
  };

  function mount(container, options) {
    if (!container) return null;
    return new TextFlow(container, options);
  }

  /* Farbe laeuft ueber CSS-Token (--textflow-color); setTheme bleibt als
     API-Haken bestehen, falls spaeter JS-seitige Anpassungen noetig werden. */
  function setTheme(_t) { /* no-op: Theming via CSS */ }

  /* Begriffe aus JSON nachladen (ersetzt den Fallback), dann Instanzen neu
     aufbauen, damit die frischen Terme greifen. Bei Fehler bleibt Fallback. */
  var pendingInstances = [];
  function loadTerms() {
    try {
      var script = document.currentScript;
      var termsUrl = script && script.src
        ? new URL("data/textflow-terms.json", script.src).toString()
        : "data/textflow-terms.json";
      fetch(termsUrl, { cache: "no-cache" })
        .then(function (r) { return r.ok ? r.json() : null; })
        .then(function (data) {
          if (data && data.groups) {
            termGroups = data.groups;
            if (data.sr) srTerms = data.sr;
            pendingInstances.forEach(function (inst) { if (inst) inst._rebuild(); });
          }
        })
        .catch(function () { /* Fallback bleibt aktiv */ });
    } catch (e) { /* Fallback bleibt aktiv */ }
  }

  window.ExpoTextFlow = {
    mount: function (container, options) {
      var inst = mount(container, options);
      pendingInstances.push(inst);
      return inst;
    },
    setTheme: setTheme,
    _loadTerms: loadTerms
  };

  function autoMountFooterTextFlow() {
    var container = document.getElementById("footer-textflow");
    if (!container || container.__expoTextFlowMounted) return;
    container.__expoTextFlowMounted = true;
    window.ExpoTextFlow.mount(container, { height: 220 });
  }

  loadTerms();
  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", autoMountFooterTextFlow);
  } else {
    autoMountFooterTextFlow();
  }
})();
