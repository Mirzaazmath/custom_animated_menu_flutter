import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
          padding: const EdgeInsets.all(22),
            /// Using The Stack Below the Menu
            child: Stack(

              children: [
                /// Using The Animated Position to Animated between
                /// Navigation Items
                AnimatedPositioned(
                  /// Position Value
                    top:6+selectedIndex*80,
                  /// Duration
                  duration:const  Duration(
                  milliseconds: 500,),
                  /// Curve Defines the Animation Behavior
                  curve: Curves.elasticOut,
                  /// Container
                  child: Container(
                  height: 56,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.deepPurpleAccent
                  ),
                    ),
                ),
                /// Actual Menu Starts from Here
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    NavigationItem(
                      isSelected: selectedIndex==0,
                      onClick: (){
                        setState(() {
                          selectedIndex=0;
                        });
                      },
                    ),
                    NavigationItem(
                      isSelected: selectedIndex==1,
                      onClick: (){
                        setState(() {
                          selectedIndex=1;
                        });
                      },
                    ),
                    NavigationItem(
                      isSelected: selectedIndex==2,
                      onClick: (){
                        setState(() {
                          selectedIndex=2;
                        });
                      },
                    )

                  ],
                )
              ],
            ),
          ),

        ),
      ),

    );
  }
}
/// Class for NavigationItem in Menu
class NavigationItem extends StatelessWidget {
 final  bool isSelected;
 final Function()? onClick;

  const NavigationItem({super.key, this.isSelected=false,this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(padding:const  EdgeInsets.all(10),
      child: InkWell(
        onTap: onClick,
        borderRadius: BorderRadius.circular(16),

        child: Container(
          height: 56,
          width: 250,
          padding:const  EdgeInsets.symmetric(horizontal: 16,vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Using TweenAnimationBuilder match the effect of our animation with
              /// our widget
              TweenAnimationBuilder(
                /// Using ColorTween
                  tween: ColorTween(
                begin: isSelected?Colors.black:Colors.white,
                end: isSelected?Colors.white:Colors.black,
                    /// Duration
              ), duration:const  Duration(milliseconds: 100),
                  /// context, animationValue,widget
                  builder: (context,value,_)=>Icon(Icons.account_balance_outlined,color: value as Color,)
              ),
             const  SizedBox(width: 16,),
              /// Same Following
              Expanded(child:  TweenAnimationBuilder(tween: ColorTween(
                begin: isSelected?Colors.black:Colors.white,
                end: isSelected?Colors.white:Colors.black,
              ), duration:const  Duration(milliseconds: 100),
                  builder: (context,value,_)=>Text("Navigation Item",style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: value as Color),)
              ),)

            ],
          ),
          
        ),
      ),
    );
  }
}
