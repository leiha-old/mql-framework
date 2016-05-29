
// ------------------------------------------------

#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

// -------------------------

#include "../../../includes.mqh"

// -------------------------

void OnInit() 
{
   

string         as1 [] = {"1" , "2"} ;
ArrayString * 
   As1 = new ArrayString ( );
   As1.hydrate ( as1 );

int totalAs1 = As1.total (  );

int iiii = 0 ;





















































};

int OnCalculate (
    const int         rates_total,      // valeur des séries temporelles d'entrée
    const int         prev_calculated,  // les barres traitées dans appel précédent 
    const datetime  & time[],           // Time
    const double    & open[],           // Open
    const double    & high[],           // High
    const double    & low[],            // Low
    const double    & close[],          // Close
    const long      & tick_volume[],    // Tick Volume
    const long      & volume[],         // Real Volume
    const int       & spread[]          // Spread
) {
  return rates_total ; 
};