--Santa_Maria_Beach

txd = engineLoadTXD("jeffers5a_lae.txd")

engineImportTXD(txd, 5406)

dff = engineLoadDFF("laecrackmotel4.dff", 5406)

engineReplaceModel(dff, 5406)

engineSetModelLODDistance(5406, 900)