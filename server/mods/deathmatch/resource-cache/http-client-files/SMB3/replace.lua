--Santa_Maria_Beach

txd = engineLoadTXD("law_beach1.txd")

engineImportTXD(txd, 6064)

dff = engineLoadDFF("LAbeach_03bx.dff", 6064)

engineReplaceModel(dff, 6064)

engineSetModelLODDistance(6064, 900)