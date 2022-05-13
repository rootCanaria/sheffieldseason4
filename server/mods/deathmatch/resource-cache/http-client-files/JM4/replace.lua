--Santa_Maria_Beach

txd = engineLoadTXD("jeffers5a_lae.txd")

engineImportTXD(txd, 5414)

dff = engineLoadDFF("laejeffers02.dff", 5414)

engineReplaceModel(dff, 5414)

engineSetModelLODDistance(5414, 900)