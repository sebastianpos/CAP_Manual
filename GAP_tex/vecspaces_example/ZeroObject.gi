AddZeroObject( vecspaces,

  function( )

    return QVectorSpace( 0 );

end );

AddUniversalMorphismIntoZeroObject( vecspaces,

  function( source )

    return VectorSpaceMorphism( source,
              HomalgZeroMatrix( Dimension( source ), 0, VECTORSPACES_FIELD ),
              QVectorSpace( 0 ) );
    
end );

AddUniversalMorphismIntoZeroObjectWithGivenZeroObject( vecspaces,

  function( source, terminal_object )

    return VectorSpaceMorphism( source,
              HomalgZeroMatrix( Dimension( source ), 0, VECTORSPACES_FIELD ),
              terminal_object );
    
end );

AddUniversalMorphismFromZeroObject( vecspaces,

  function( sink )
    
    return VectorSpaceMorphism( QVectorSpace( 0 ),
              HomalgZeroMatrix( 0, Dimension( sink ), VECTORSPACES_FIELD ),
              sink );
    
end );

AddUniversalMorphismFromZeroObjectWithGivenZeroObject( vecspaces,

  function( sink, initial_object )
    
    return VectorSpaceMorphism( initial_object,
                   HomalgZeroMatrix( 0, Dimension( sink ), VECTORSPACES_FIELD ),
                   sink );
    
end );