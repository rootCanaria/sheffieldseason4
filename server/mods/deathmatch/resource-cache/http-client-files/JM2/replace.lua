--Santa_Maria_Beach

txd = engineLoadTXD("jeffers4_lae.txd")

engineImportTXD(txd, 5459)

dff = engineLoadDFF("laejeffers01.dff", 5459)

engineReplaceModel(dff, 5459)

engineSetModelLODDistance(5459, 900)