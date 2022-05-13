--5emh

txd = engineLoadTXD("gangblok1_lae2.txd")

engineImportTXD(txd, 17700)

dff = engineLoadDFF("pigpenblok1_lae2.dff", 17700)

engineReplaceModel(dff, 17700)

engineSetModelLODDistance(17700, 900)