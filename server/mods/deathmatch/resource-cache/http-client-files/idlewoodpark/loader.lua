local modelId = 4012


col = engineLoadCOL( "4012.col" )
txd = engineLoadTXD( "4012.txd" )
dff = engineLoadDFF( "4012.dff", 0 )
 
engineReplaceCOL( col, modelId )
engineImportTXD( txd, modelId )
engineReplaceModel( dff, modelId )

