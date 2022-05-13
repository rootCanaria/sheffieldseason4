--5emh

txd = engineLoadTXD("lae2roads.txd")

engineImportTXD(txd, 17642)

dff = engineLoadDFF("lae2_roads90.dff", 17642)

engineReplaceModel(dff, 17642)

engineSetModelLODDistance(17642, 900)