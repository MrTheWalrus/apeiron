(function () {
  "use strict";

  var self = Apeiron.Systems.structural = {};

  self.onDocumentReady = function(){
    Apeiron.home.setStatus('loading');
    Apeiron.home.logLines([
      ["<span class='heading'>Superstruture Status Report:</span>", 100],
      ["Sector 1: <span class='warn'> Minor damage due to icing.</span> Structural Integrity: <span class='good'>95%</span>", 100],
      ["Sector 2: <span class='warn'> Minor damage due to icing.</span> Structural Integrity: <span class='good'>95%</span>", 100],
      ["Sector 3: <span class='warn'> Minor damage due to impact.</span> Structural Integrity: <span class='warn'>85%</span>", 500],
      ["Sector 4: <span class='bad'>Major exterior breach. Massive damage through multiple decks.</span> Structural Integrity: <span class='bad'>28%</span>", 200],
      ["Sector 5: <span class='warn'>Moderate damage due to core breach.</span> Structural Integrity: <span class='warn'>75%</span>", 100],
      ["Sector 6: <span class='good'>All structural systems nominal.</span> Structural Integrity: <span class='good'>100%</span>", 500],
      ["Summary: Major repairs needed. Attempting lift-off would result in near-certain destruction.", 100]
    ]);
    $('ul.log').one('finished', function(){
      Apeiron.home.setStatus('systems');
    });
  }

}());