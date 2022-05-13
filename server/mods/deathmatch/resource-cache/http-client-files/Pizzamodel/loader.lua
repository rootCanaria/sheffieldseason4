local modelId = 5418


col = engineLoadCOL( "5418.col" )
--txd = engineLoadTXD( "5408.txd" )
dff = engineLoadDFF( "5418.dff", 0 )
 
engineReplaceCOL( col, modelId )
--engineImportTXD( txd, modelId )
engineReplaceModel( dff, modelId )

