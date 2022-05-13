--Santa_Maria_Beach

txd = engineLoadTXD("motel_lae.txd")

engineImportTXD(txd, 5413)

dff = engineLoadDFF("laecrackmotel1.dff", 5413)

engineReplaceModel(dff, 5413)

engineSetModelLODDistance(5413, 900)