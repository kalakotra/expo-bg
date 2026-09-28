/*!
FullCalendar Core v6.1.14
Docs & License: https://fullcalendar.io
(c) 2024 Adam Shaw
*/
(function (index_js) {
    'use strict';

    function affix(buttonText) {
        return (buttonText === 'Day' || buttonText === 'Month') ? 'r' :
            buttonText === 'Year' ? 's' : '';
    }
    var locale = {
        code: 'en',
        week: {
            dow: 1,
            doy: 4, // The week that contains Jan 4th is the first week of the year.
        },
        buttonText: {
            prev: 'Prev',
            next: 'Next',
            today: 'Today',
            year: 'Year',
            month: 'Month',
            week: 'Week',
            day: 'Day',
            list: 'List',
        },
        weekText: 'CW',
        weekTextLong: 'Week',
        allDayText: 'All-day',
        moreLinkText(n) {
            return '+ weitere ' + n;
        },
        noEventsText: 'No events to display',
        buttonHints: {
            prev(buttonText) {
                return `Previous${affix(buttonText)} ${buttonText}`;
            },
            next(buttonText) {
                return `Next${affix(buttonText)} ${buttonText}`;
            },
            today(buttonText) {
                // → Heute, Diese Woche, Dieser Monat, Dieses Jahr
                if (buttonText === 'Day') {
                    return 'Today';
                }
                return `This${affix(buttonText)} ${buttonText}`;
            },
        },
        viewHint(buttonText) {
            // → Tagesansicht, Wochenansicht, Monatsansicht, Jahresansicht
            const glue = buttonText === 'Week' ? 'n' : buttonText === 'Month' ? 's' : 's';
            return buttonText + glue + 'ansicht';
        },
        navLinkHint: 'Go to $0',
        moreLinkHint(eventCnt) {
            return 'Show ' + (eventCnt === 1 ?
                'one more event' :
                eventCnt + ' more events');
        },
        closeHint: 'Close',
        timeHint: 'Time',
        eventHint: 'Event',
    };

    index_js.globalLocales.push(locale);

})(FullCalendar);
