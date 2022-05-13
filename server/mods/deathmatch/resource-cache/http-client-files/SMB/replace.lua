--Santa_Maria_Beach

txd = engineLoadTXD("santavenice3.txd")

engineImportTXD(txd, 6042)

dff = engineLoadDFF("venblue01_law.dff", 6042)

engineReplaceModel(dff, 6042)

engineSetModelLODDistance(6042, 900)