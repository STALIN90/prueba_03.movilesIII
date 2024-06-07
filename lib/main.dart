import 'package:app_04/Ventana01.dart';
import 'package:app_04/Ventana02.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(Aplicacion04());
}

class Aplicacion04 extends StatelessWidget {
  const Aplicacion04({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Aplicación 4",
      home : Home(),
      
    );
    
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  int indice=1;
  @override
  Widget build(BuildContext context) {
    List <Widget> screens=[Cuerpo(context),Ventana01(),Ventana02()];
    return Scaffold(
      appBar: AppBar(
        title:Text("Titulo Principal"),
      ),
      body: screens[indice],// Cuerpo(context),


      bottomNavigationBar: BottomNavigationBar (
     currentIndex: indice,
     onTap: (value) {
      setState(() {
        indice=value;
      });
     },
     items:[
      BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label:"Principal"),
      BottomNavigationBarItem(icon: Icon(Icons.tsunami),label:"Ventana 01"),
      BottomNavigationBarItem(icon: Image.network("https://4kwallpapers.com/images/walls/thumbs_3t/16981.jpg"),label:"Ventana 02"),
      
  
        
      ],
      ),
    );
  }
}

Widget Cuerpo(context){
  return Column(
    children: [
      Text("Navegacion y alertas"),
      Boton1(context)
     
    ],
  );
}

Widget Boton1(context){
  return(
    ElevatedButton(onPressed: (){
      ////////////////////////////
      Navigator.push(context, 
      MaterialPageRoute(builder: 
      (context) => const Ventana01()
      )
      );
      
      ///////////////////////////
      

    }, child: Text("Ir a la ventana 01"))
  );
}
