local modelId = 5408



col = engineLoadCOL( "5408.col" )
txd = engineLoadTXD( "5408.txd" )
dff = engineLoadDFF( "5408.dff", 0 )
 
engineReplaceCOL( col, modelId )
engineImportTXD( txd, modelId )
engineReplaceModel( dff, modelId )

