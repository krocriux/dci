//import processing.serial.*;
//Serial myPort;
String descripcion = "",actual = "";
int var=0;
import controlP5.*;
ControlP5 miControl;
int c;
float humedad,temperatura,luz;
float humedad_actual=0,temperatura_actual=0,luz_actual=0;

void setup() {
 size(580,260); 
 //myPort = new Serial(this,"COM4",9600);
 
 miControl = new ControlP5(this);
 miControl.addKnob("Humedad",0,100,0,50,30,150).hide().setLabel("Nivel de humedad %");
 miControl.addKnob("Temperatura",0,20,0,220,30,150).hide().setLabel("Temperatura °C");
 miControl.addKnob("Luz",0,100,0,390,30,150).hide().setLabel("Intensidad de luz 0-100");
 miControl.addButton("Planes",0,145,85,93,90).setColorBackground( color( 255,0,0 ) );
 miControl.addButton("Personalizado",1,243,85,93,90).setColorBackground( color( 0,255,0 ) );
 miControl.addButton("Estadisticas",2,341,85,93,90).setColorBackground( color( 0,0,255 ) );
 miControl.addButton("Volver1",3,10,10,100,20).setColorBackground( color( 100,0,255 ) ).hide().setLabel("Volver");
 miControl.addButton("Volver2",3,10,10,100,20).setColorBackground( color( 100,0,255 ) ).hide().setLabel("Volver");
 miControl.addButton("Volver3",3,10,10,100,20).setColorBackground( color( 100,0,255 ) ).hide().setLabel("Volver");
 miControl.addButton("DefinirPersonalizado",3,25,210,530,40).setColorBackground( color( 100,0,255 ) ).hide().setLabel(actual);
 miControl.addButton("Plan1",4,145,85,93,90).setColorActive(color(222,217,32)).setColorForeground(color( 143,136,0 )).setColorBackground(color( 107,127,6 )).hide();
 miControl.addButton("Plan2",5,243,85,93,90).setColorActive(color(222,217,32)).setColorForeground(color( 143,136,0)).setColorBackground( color( 107,127,6 ) ).hide();
 miControl.addButton("Plan3",6,341,85,93,90).setColorActive(color(222,217,32)).setColorForeground(color( 143,136,0 )).setColorBackground( color(  107,127,6  ) ).hide();
 miControl.addButton("Descripcion1",7,145,175,93,30).setColorActive(color(222,217,32)).setColorForeground(color( 143,136,0 )).setColorBackground(color( 107,127,6 )).hide().setLabel("Descripcion del plan 1");
 miControl.addButton("Descripcion2",8,243,175,93,30).setColorActive(color(222,217,32)).setColorForeground(color( 143,136,0)).setColorBackground( color( 107,127,6 ) ).hide().setLabel("Descripcion del plan 2");
 miControl.addButton("Descripcion3",9,341,175,93,30).setColorActive(color(222,217,32)).setColorForeground(color( 143,136,0 )).setColorBackground( color(  107,127,6  ) ).hide().setLabel("Descripcion del plan 3");
 miControl.addButton("Descripcion",9,145,175,289,30).setColorActive(color(222,217,32)).setColorForeground(color( 143,136,0 )).setColorBackground( color(  107,127,6  ) ).hide().setLabel(descripcion);
 
}

void draw() {
 
 if(var == 0)
 {
   background(c);
   fill(255);
   rect(140, 80, 299, 100);
 }
 if(var == 1)
 {
   miControl.getController("Descripcion").setLabel(descripcion);
   background(c);
 }
 if(var == 2)
 {
   
  miControl.getController("Humedad").show();
  miControl.getController("Temperatura").show();
  miControl.getController("Luz").show();
  float t= round(temperatura_actual*10)/10;
  float h= round(humedad_actual*10)/10;
  float l= round(luz_actual*10)/10;
  actual = "Definir nuevos valores!, la temperatura definida actualmente es: "+str(t)+" la humedad es: "+str(h)+" y la intensidad de luz actual es: "+str(l)+" ";
  miControl.getController("DefinirPersonalizado").setLabel(actual);
   background(c);
 }
 if(var == 3)
 {
   background(c);
 }
 

}

void Planes()
{
    var=1;
    c = 255;
    miControl.getController("Planes").hide();
    miControl.getController("Estadisticas").hide();
    miControl.getController("Personalizado").hide();
    miControl.getController("Volver1").show();
    miControl.getController("Plan1").show();
    miControl.getController("Plan2").show();
    miControl.getController("Plan3").show();
    miControl.getController("Descripcion1").show();
    miControl.getController("Descripcion2").show();
    miControl.getController("Descripcion3").show();
}
void DefinirPersonalizado()
{
 humedad_actual = humedad;
 temperatura_actual = temperatura;
 luz_actual = luz;
}
void Humedad(float valor)
{
  humedad = valor;
}
void Temperatura(float valor)
{
  temperatura = valor;
}
void Luz(float valor)
{
  luz = valor;
}
void Descripcion1()
{
  
   miControl.getController("Descripcion").show();
   descripcion = "Este plan hace esta y esta otra wea .....";
  
}
void Descripcion2()
{
  
   miControl.getController("Descripcion").show();
   descripcion = "Este plan hace esta y esta otra wea .....";
  
}
void Descripcion3()
{
  
   miControl.getController("Descripcion").show();
   descripcion = "Este plan hace esta y esta otra wea .....";
  
}
void Descripcion()
{
  
   miControl.getController("Descripcion").hide();
  
}
void Personalizado()
{
  var=2;
  c = 128;
  miControl.getController("Planes").hide();
  miControl.getController("Estadisticas").hide();
  miControl.getController("Personalizado").hide();
  miControl.getController("Volver2").show();
  miControl.getController("DefinirPersonalizado").show();
}
void Volver2 (){
  var=0;
   miControl.getController("Planes").show();
  miControl.getController("Estadisticas").show();
  miControl.getController("Personalizado").show();
  miControl.getController("Volver2").hide();
  miControl.getController("DefinirPersonalizado").hide();
  miControl.getController("Humedad").hide();
  miControl.getController("Temperatura").hide();
  miControl.getController("Luz").hide();
}
void Estadisticas()
{
  var=3;
  c = 0;
   miControl.getController("Planes").hide();
  miControl.getController("Estadisticas").hide();
  miControl.getController("Personalizado").hide();
    miControl.getController("Volver3").show();
}
void Volver3()
{
 var = 0;
 miControl.getController("Volver3").hide();
 miControl.getController("Personalizado").show();
 miControl.getController("Estadisticas").show();
 miControl.getController("Planes").show();
}
void Volver1()
{
  var=0;
  c = 0;
   miControl.getController("Planes").show();
  miControl.getController("Estadisticas").show();
  miControl.getController("Personalizado").show();
    miControl.getController("Volver1").hide();
    miControl.getController("Plan1").hide();
    miControl.getController("Plan2").hide();
    miControl.getController("Plan3").hide();
    miControl.getController("Descripcion1").hide();
    miControl.getController("Descripcion2").hide();
    miControl.getController("Descripcion3").hide();
}
void Plan1()
{
  miControl.getController("Plan1").setColorBackground(color( 191,217,32 ));
  miControl.getController("Descripcion1").setColorBackground(color( 191,217,32 ));
  miControl.getController("Plan2").setColorBackground(color( 107,127,6 ));
  miControl.getController("Plan3").setColorBackground(color( 107,127,6 ));
     miControl.getController("Descripcion2").setColorBackground(color( 107,127,6 ));
   miControl.getController("Descripcion3").setColorBackground(color( 107,127,6 ));
}
void Plan2()
{
   miControl.getController("Plan2").setColorBackground(color( 191,217,32 ));
   miControl.getController("Descripcion2").setColorBackground(color( 191,217,32 ));
   miControl.getController("Descripcion1").setColorBackground(color( 107,127,6 ));
   miControl.getController("Descripcion3").setColorBackground(color( 107,127,6 ));
  miControl.getController("Plan1").setColorBackground(color( 107,127,6 ));
  miControl.getController("Plan3").setColorBackground(color( 107,127,6 ));
}
void Plan3()
{
   miControl.getController("Plan3").setColorBackground(color( 191,217,32 ));
   miControl.getController("Descripcion3").setColorBackground(color( 191,217,32 ));
  miControl.getController("Plan2").setColorBackground(color( 107,127,6 ));
  miControl.getController("Plan1").setColorBackground(color( 107,127,6 ));
     miControl.getController("Descripcion1").setColorBackground(color( 107,127,6 ));
   miControl.getController("Descripcion2").setColorBackground(color( 107,127,6 ));
}