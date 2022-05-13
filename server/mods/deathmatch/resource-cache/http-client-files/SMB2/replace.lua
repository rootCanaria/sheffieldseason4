--Santa_Maria_Beach

txd = engineLoadTXD("lawwhitebuilds.txd")

engineImportTXD(txd, 6213)

dff = engineLoadDFF("venlaw_grnd.dff", 6213)

engineReplaceModel(dff, 6213)

engineSetModelLODDistance(6213, 900)