AddDirectSum( vecspaces,

  function( object_product_list )
    local dim;
    
    dim := Sum( List( object_product_list, c -> Dimension( c ) ) );
    
    return QVectorSpace( dim );
  
end );

AddInjectionOfCofactorOfDirectSum( vecspaces,

  function( object_product_list, injection_number )
    local components, dim, dim_pre, dim_post, dim_cofactor, coproduct, number_of_objects, injection_of_cofactor;
    
    components := object_product_list;
    
    number_of_objects := Length( components );
    
    dim := Sum( components, c -> Dimension( c ) );
    
    dim_pre := Sum( components{ [ 1 .. injection_number - 1 ] }, c -> Dimension( c ) );
    
    dim_post := Sum( components{ [ injection_number + 1 .. number_of_objects ] }, c -> Dimension( c ) );
    
    dim_cofactor := Dimension( object_product_list[ injection_number ] );
    
    coproduct := QVectorSpace( dim );
    
    injection_of_cofactor := HomalgZeroMatrix( dim_cofactor, dim_pre ,VECTORSPACES_FIELD );
    
    injection_of_cofactor := UnionOfColumns( injection_of_cofactor, 
                                         HomalgIdentityMatrix( dim_cofactor, VECTORSPACES_FIELD ) );
    
    injection_of_cofactor := UnionOfColumns( injection_of_cofactor, 
                                         HomalgZeroMatrix( dim_cofactor, dim_post, VECTORSPACES_FIELD ) );
    
    return VectorSpaceMorphism( object_product_list[ injection_number ], injection_of_cofactor, coproduct );

end );

AddUniversalMorphismFromDirectSum( vecspaces,

  function( diagram, sink )
    local dim, coproduct, components, universal_morphism, morphism;
    
    components := sink;
    
    dim := Sum( components, c -> Dimension( Source( c ) ) );
    
    coproduct := QVectorSpace( dim );
    
    universal_morphism := sink[1]!.morphism;
    
    for morphism in components{ [ 2 .. Length( components ) ] } do
    
      universal_morphism := UnionOfRows( universal_morphism, morphism!.morphism );
  
    od;
  
    return VectorSpaceMorphism( coproduct, universal_morphism, Range( sink[1] ) );
  
end );

AddProjectionInFactorOfDirectSum( vecspaces,

  function( object_product_list, projection_number )
    local components, dim, dim_pre, dim_post, dim_factor, direct_product, number_of_objects, projection_in_factor;
    
    components := object_product_list;
    
    number_of_objects := Length( components );
    
    dim := Sum( components, c -> Dimension( c ) );
    
    dim_pre := Sum( components{ [ 1 .. projection_number - 1 ] }, c -> Dimension( c ) );
    
    dim_post := Sum( components{ [ projection_number + 1 .. number_of_objects ] }, c -> Dimension( c ) );
    
    dim_factor := Dimension( object_product_list[ projection_number ] );
    
    direct_product := QVectorSpace( dim );
    
    projection_in_factor := HomalgZeroMatrix( dim_pre, dim_factor, VECTORSPACES_FIELD );
    
    projection_in_factor := UnionOfRows( projection_in_factor, 
                                         HomalgIdentityMatrix( dim_factor, VECTORSPACES_FIELD ) );
    
    projection_in_factor := UnionOfRows( projection_in_factor, 
                                         HomalgZeroMatrix( dim_post, dim_factor, VECTORSPACES_FIELD ) );
    
    return VectorSpaceMorphism( direct_product, projection_in_factor, object_product_list[ projection_number ] );

end );

AddUniversalMorphismIntoDirectSum( vecspaces,

  function( diagram, sink )
    local dim, direct_product, components, universal_morphism, morphism;
    
    components := sink;
    
    dim := Sum( components, c -> Dimension( Range( c ) ) );
    
    direct_product := QVectorSpace( dim );
    
    universal_morphism := sink[1]!.morphism;
    
    for morphism in components{ [ 2 .. Length( components ) ] } do
    
      universal_morphism := UnionOfColumns( universal_morphism, morphism!.morphism );
  
    od;
  
    return VectorSpaceMorphism( Source( sink[1] ), universal_morphism, direct_product );
  
end );