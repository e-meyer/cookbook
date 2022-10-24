import 'package:cookbook/components/tab_bar_contents/brief.dart';
import 'package:cookbook/components/tab_bar_contents/ingredients.dart';
import 'package:cookbook/helpers/colorpallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cookbook/models/recipe.dart';

class TabBarSelector extends StatefulWidget {
  const TabBarSelector({super.key, required this.recipe});

  final Recipe recipe;

  @override
  State<TabBarSelector> createState() => _TabBarSelectorState();
}

class _TabBarSelectorState extends State<TabBarSelector>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Container(
                // height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorPallete.defaultGrey,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TabBar(
                        labelColor: ColorPallete.primaryText,
                        unselectedLabelColor: ColorPallete.secondaryText,
                        controller: tabController,
                        indicator: BoxDecoration(
                          color: ColorPallete.plainWhite,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: const Color(0xFF808080).withOpacity(0.2),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        tabs: [
                          Tab(
                            child: Text(
                              'INGREDIENTS',
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Tab(
                            text: 'BRIEFLY',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  physics: const BouncingScrollPhysics(),
                  controller: tabController,
                  children: [
                    Ingredients(),
                    Brief(recipe: widget.recipe),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
