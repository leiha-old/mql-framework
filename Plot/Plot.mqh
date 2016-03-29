// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

class Plot : public Object
{
   protected :
   
      int _slot;  
      
      /** 
       */
      Plot* set(ENUM_PLOT_PROPERTY_STRING property, string value) {
         PlotIndexSetString(_slot, property, value);  
         return GetPointer(this);
      };
      
      /** 
       */
      Plot* set(ENUM_PLOT_PROPERTY_INTEGER property, int value) {
         PlotIndexSetInteger(_slot, property, value);  
         return GetPointer(this);
      };
      
      /** 
       */
      Plot* set(ENUM_PLOT_PROPERTY_DOUBLE property, double value) {
         PlotIndexSetDouble(_slot, property, value);  
         return GetPointer(this);
      };
   
   public :   
   
      /** 
       */
      Plot(int slot)
         : _slot(slot)
         {}
      ;  
      
      /** 
       * Spécifie la valeur vide de la construction graphique
       */
      Plot* emptyValue(double value = 0) {
         return set(PLOT_EMPTY_VALUE, value);
      };
      
      /** 
       * Le label de la construction graphique
       */
      Plot* label(string label) {
         return set(PLOT_LABEL, label);
      };
      
      /** 
       * Le type de la construction graphique
       */
      Plot* type(ENUM_DRAW_TYPE type = DRAW_LINE) {
         return set(PLOT_DRAW_TYPE, type);
      };
      
      /**
       * Le nombre de barres initiales sans dessin et les valeurs dans DataWindow 
       */
      Plot* begin(int shift = 0) {
         return set(PLOT_DRAW_BEGIN, shift);
      };
      
      /**
       * Couleur de la ligne
       */
      Plot* c0lor(int c0lor) {
         return set(PLOT_LINE_COLOR, c0lor);
      };      
      
      /**
       * Couleur de la ligne
       */
      Plot* c0lor(int i, int c0lor) {
         PlotIndexSetInteger(_slot, PLOT_LINE_COLOR, i, c0lor);  
         return GetPointer(this);
      };
   
      /**
       * Epaisseur de la ligne
       */
      Plot* width(int width = 1) {
         return set(PLOT_LINE_WIDTH, width);
      };
      
      /**
       * Style de la ligne
       */
      Plot* style(ENUM_LINE_STYLE style = STYLE_SOLID) {
         return set(PLOT_LINE_STYLE, style);
      };
};