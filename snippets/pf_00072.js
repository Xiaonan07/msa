yourDiv.textContent = "loading. please wait."

biojs.io.fasta.parse.read('http://dev.biojs-msa.org/v1/dummy/external/PF00072_rp15.txt', function(seqs) {
var opts = {};
opts.seqs = seqs;
opts.el = yourDiv;
opts.vis = {conserv: false, overviewbox: true}
opts.zoomer = {boxRectHeight: 1, boxRectWidth: 1, labelWidth: 270,labelFontsize: "12px",labelIdLength: 50, alignmentHeight: window.innerHeight * 0.8}
var m = new msa.msa(opts);

// the menu is independent to the MSA container
var menuOpts = {};
var menuDiv = document.createElement('div');
document.body.appendChild(menuDiv);
menuOpts.el = menuDiv;
menuOpts.msa = m;
var defMenu = new msa.menu.defaultmenu(menuOpts);
//defMenu.createMenu();

m.addView("menu", defMenu);

m.render();

});