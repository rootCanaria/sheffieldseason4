function applySkin()
	
	txd = engineLoadTXD("mod.txd", 494)
	
	engineImportTXD(txd, 494)
	
	dff = engineLoadDFF("mod.dff", 494)
	
	engineReplaceModel(dff, 494)
	
end

addEventHandler("onClientResourceStart", resourceRoot, applySkin)