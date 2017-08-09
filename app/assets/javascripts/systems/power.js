(function () {
  "use strict";

  var self = Apeiron.Systems.power = {};

  self.onDocumentReady = function(){
    // TODO: Formatting for reports, align values?
    Apeiron.home.logLines([
      ["<span class='heading'>Power System Registry</span>", 100],
      ["System Registry 0: <i>Potentia</i> Nexus - Primary Power", 100],
      [" - Crystal Status: <span class='good'>1</span> <span class='bad'>2</span> <span class='bad'>3</span> <span class='bad'>4</span> <span class='good'>5</span> <span class='bad'>6</span>", 500],
      [" - Two (2) Crystals Active and Aligned. Power Generation: <span class='warn'>~1.85%</span> standard operating capacity.", 500],
      [" - Power Reserves: <span class='bad'>0.0000128%</span>", 500],
      [" - Estimated time to reserve depletion: <span class='warn'>540.0 standard years</span>", 500],
      ["System Registry 1: CORE TAP SYSTEM REGISTERED - <span class='bad'>&lt;configuration error&gt;</span>", 500],
      ["System Registry 2: Naquadah Geneators - Secondary Power", 100],
      [" - Generator One - Bridge: <span class='good'>Online</span>", 300],
      [" - Generator Two - Arboretum: <span class='good'>Online</span>", 300],
      [" - Generator Three - Engineering: <span class='good'>Online</span>", 300],
      [" - Ship sectors powered (est): <span class='warn'>12%</span>", 100]
    ]);
    $('ul.log').one('finished', function(){
      Apeiron.home.setStatus('systems');
    })
  }
}());