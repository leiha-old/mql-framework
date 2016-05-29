#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

class Data 
{
   public :

/* --------------------
 * Properties
 * ----- 
 */   
      int       rates_total;      // valeur des séries temporelles d'entrée
      int       prev_calculated;  // les barres traitées dans appel précédent 
      datetime  time        [];   // Time
      double    open        [];   // Open
      double    high        [];   // High
      double    low         [];   // Low
      double    close       [];   // Close
      long      tick_volume [];   // Tick Volume
      long      volume      [];   // Real Volume
      int       spread      [];   // Spread

/* --------------------
 * Constructors
 * ----- 
 */   
      /** 
       */
      Data( 
         const int         irates_total,      
         const int         iprev_calculated,  
         const datetime  & itime        [],           
         const double    & iopen        [],           
         const double    & ihigh        [],           
         const double    & ilow         [],            
         const double    & iclose       [],          
         const long      & itick_volume [],    
         const long      & ivolume      [],         
         const int       & ispread      []          
      )
         {
           rates_total     = irates_total     ;
           prev_calculated = iprev_calculated ;
           
           ArrayCopy( time        , itime );
           ArrayCopy( open        , iopen );
           ArrayCopy( high        , ihigh );
           ArrayCopy( low         , ilow );
           ArrayCopy( close       , iclose );
           ArrayCopy( tick_volume , itick_volume );
           ArrayCopy( volume      , ivolume );
           ArrayCopy( spread      , ispread );
           
         }
      ;

/* --------------------
 * Methods
 * ----- 
 */  
      
   protected :
      
/* --------------------
 * Properties
 * ----- 
 */
    
      
// -----
// --------------------    
};