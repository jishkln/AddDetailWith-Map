import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sampleadd/controller/addcontroller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AddController>(builder: (value) {
        return value.isLoading.value
            ? Center(
                child: CupertinoActivityIndicator(
                  color: Colors.amber,
                ),
              )
            : ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const CoustomImageView(),
                  SizedBox(
                    height: size.height * .08,
                  ),
                  const Divider(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    width: size.width,
                    child: Row(
                      children: [
                        CoustemModelRow(
                          title: "Status",
                          subTitle: value.details!.adStatus!,
                          size: size,
                        ),
                        CoustemModelRow(
                          title: "Title",
                          subTitle: value.details!.subCategory!,
                          size: size,
                        ),
                        CoustemModelRow(
                          title: "AddType",
                          subTitle: value.details!.adType!,
                          size: size,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  const Divider(),
                  SpecialMention(size: size),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  const Divider(),
                  DetailWidget(size: size),
                ],
              );
      }),
    );
  }
}

class DetailWidget extends StatelessWidget {
  const DetailWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddController>(builder: (value) {
      return Padding(
        padding: const EdgeInsets.only(right: 36.0, left: 16, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$${value.details!.price!.toString()}",
                  style: GoogleFonts.questrial(
                    fontSize: 31,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(child: Container()),
                Text(
                  "Posted",
                  style: GoogleFonts.questrial(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: size.width * .02,
                ),
                Text(
                  value.postedDate,
                  style: GoogleFonts.questrial(
                    fontSize: 16,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * .02,
            ),
            Text(
              "HyndayPM+685, Machanpally",
              style: GoogleFonts.questrial(
                fontSize: 31,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: size.height * .02,
            ),
            Text(
              value.details!.description!,
              style: GoogleFonts.questrial(
                  fontSize: 25,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w600,
                  wordSpacing: 1,
                  letterSpacing: 1.1,
                  height: 1.5),
            ),
            SizedBox(
              height: size.height * .06,
            ),
            Text(
              "Map",
              style: GoogleFonts.questrial(
                fontSize: 31,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: size.height * .02,
            ),
            Container(
              color: Colors.amber,
              width: size.width,
              height: size.height / 5,
              child: GoogleMap(
                initialCameraPosition:
                    CameraPosition(target: value.loation, zoom: 10),
                onMapCreated: (controller) => value.addMarker(),
                markers: value.markers.values.toSet(),
              ),
            ),
            SizedBox(
              height: size.height * .05,
            ),
            Text(
              "From",
              style: GoogleFonts.questrial(
                fontSize: 31,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: size.height * .01,
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 0, right: 0),
              leading: CircleAvatar(
                //radius: 30,

                foregroundImage: NetworkImage(value.userImage),
              ),
              title: Text(
                value.userDetails!.name!,
                style: GoogleFonts.questrial(
                  fontSize: 26,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "${value.userDetails!.name!}  ${value.userDate}",
                style: GoogleFonts.questrial(
                  fontSize: 16,
                  // color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios)),
            ),
            SizedBox(
              height: size.height * .02,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 26, 39, 65))),
                      onPressed: () {},
                      child: Text(
                        "Make offer",
                        style: GoogleFonts.questrial(
                          fontSize: 21,
                          // color: Colors.black,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * .02,
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)),
                    onPressed: () {},
                    child: const Icon(Icons.chat_bubble_outline),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * .1,
            ),
          ],
        ),
      );
    });
  }
}

class SpecialMention extends StatelessWidget {
  const SpecialMention({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddController>(builder: (value) {
      return Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Special Mentions",
                style: GoogleFonts.questrial(
                  fontSize: 16,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: size.height * .01,
              ),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(
                  value.spetialMention.length,
                  (index) => Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 3),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      value.spetialMention[index],
                      style: GoogleFonts.questrial(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

class CoustemModelRow extends StatelessWidget {
  const CoustemModelRow({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.size,
  }) : super(key: key);
  final String title;
  final String subTitle;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 21.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: GoogleFonts.questrial(
              fontSize: 16,
              color: Colors.grey[500],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: size.height * .009,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              subTitle,
              style: GoogleFonts.questrial(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CoustomImageView extends StatelessWidget {
  const CoustomImageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<AddController>(builder: (data) {
      return Container(
        height: size.height / 2,
        color: Colors.amber,
        child: Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              height: 500,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(data.addImag[data.currentIndex]),
                      fit: BoxFit.fill)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(child: Container()),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: -40,
              child: Container(
                width: size.width,
                height: size.height * .1,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                child: ListView.builder(
                  itemCount: data.addImag.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 16, top: 12, bottom: 6),
                      child: InkWell(
                        onTap: () => data.setIndex(index),
                        child: Container(
                          height: 100,
                          width: 80,
                          // color: Colors.amber,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      data.addImag[index].toString()),
                                  fit: BoxFit.cover),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
