--Santa_Maria_Beach

txd = engineLoadTXD("macpark1tr_lae.txd")

engineImportTXD(txd, 5458)

dff = engineLoadDFF("laeMacPark01.dff", 5458)

engineReplaceModel(dff, 5458)

engineSetModelLODDistance(5458, 900)