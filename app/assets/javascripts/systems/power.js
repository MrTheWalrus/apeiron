(function () {
  "use strict";

  var self = Apeiron.Systems.power = {};

  self.onDocumentReady = function(){
    // TODO: Formatting for reports, align values?
    Apeiron.home.logLines([
      ["<span class='heading'>Power System Registry</span>", 100],
      ["System Registry 0: <i>Potentia</i> Nexus - Primary Power", 100],
      [" - Crystal Status: <span class='good'>1</span> <span class='good'>2</span> <span class='good'>3</span> <span class='good'>4</span> <span class='good'>5</span> <span class='good'>6</span>", 500],
      [" - Six (6) Crystals Active and Aligned. Power Generation: <span class='good'>115.3%</span> standard operating capacity.", 500],
      [" - Power Reserves: <span class='warn'>6.3%</span>", 500],
      [" - Estimated time to fill reserve: <span class='good'>38.8 standard days</span>", 500],
      ["System Registry 1: CORE TAP SYSTEM REGISTERED - <span class='warn'>CORE TAP READY</span>", 500],
      ["System Registry 2: Naquadah Geneators - Secondary Power", 100],
      [" - Generator One - Bridge: <span class='good'>Online</span>", 300],
      [" - Generator Two - Arboretum: <span class='good'>Online</span>", 300],
      [" - Generator Three - Engineering: <span class='good'>Online</span>", 300],
      [" - Ship sectors powered (est): <span class='good'>97%</span>", 100]
    ]);
    $('ul.log').one('finished', function(){
      Apeiron.home.setStatus('systems');
    })
  }
}());