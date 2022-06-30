import 'package:flutter/material.dart';
import 'package:task/models/welcome.dart';
import 'package:intl/intl.dart';

class DetailedScreen extends StatefulWidget {
  Map welcome;
  DetailedScreen(this.welcome);

  @override
  State<DetailedScreen> createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brewries Details'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              const Positioned(
                top: 50,
                left: 30,
                child: Text(
                  'Brewerires Name',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Positioned(
                top: 90,
                left: 30,
                child: Text(
                  "${widget.welcome['name'] ?? "N/A"}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 17),
                ),
              ),
              const Positioned(
                top: 140,
                left: 30,
                child: Text(
                  'Brewerires Type',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Positioned(
                top: 180,
                left: 30,
                child: Text(
                  "${widget.welcome['brewery_type'] ?? "N/A"}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
              ),
              const Positioned(
                top: 220,
                left: 30,
                child: Text(
                  'Brewerires Phone',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Positioned(
                top: 260,
                left: 30,
                child: Text(
                  "${widget.welcome['phone'] ?? "N/A"}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
              ),
              const Positioned(
                top: 300,
                left: 30,
                child: Text(
                  'Brewerires Address',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Positioned(
                top: 340,
                left: 30,
                child: Text(
                  "${widget.welcome['street'] ?? "N/A"} ${widget.welcome['city'] ?? "N/A"}\n${widget.welcome['state'] ?? "N/A"} ${widget.welcome['country'] ?? "N/A"} ${widget.welcome['postal_code'] ?? "N/A"}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
              ),
              const Positioned(
                top: 400,
                left: 30,
                child: Text(
                  'Brewerires Website',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Positioned(
                top: 430,
                left: 30,
                child: Text(
                  "${widget.welcome['website_url'] ?? "N/A"}",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              const Positioned(
                top: 460,
                left: 30,
                child: Text(
                  'Brewerires Created At',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Positioned(
                top: 500,
                left: 30,
                child: Text(
                  "${widget.welcome['created_at'] ?? "N/A"}",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
