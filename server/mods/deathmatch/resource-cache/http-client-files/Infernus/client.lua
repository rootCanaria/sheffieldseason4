function applySkin()
	
	txd = engineLoadTXD("mod.txd", 411)
	
	engineImportTXD(txd, 411)
	
	dff = engineLoadDFF("mod.dff", 411)
	
	engineReplaceModel(dff, 411)
	
end

addEventHandler("onClientResourceStart", resourceRoot, applySkin)