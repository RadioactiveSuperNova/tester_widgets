// Pull json data from WorldTimeAPI.org
// https://worldtimeapi.org/api/timezone/America/Chicago
// Store variable string data to namedlocation.
//On ElevatedButton Press get & print to console
// Change Button Text to $TIME/DATE Retrieved onpress.

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'main.dart';

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://worldtimeapi.org/api/timezone/America/Chicago'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final int abbreviation;
  final int client_id;
  final String datetime;
  final int day_of_week;
  final int day_of_year;
  final bool dst;
  final String dst_from;
  final int dst_offset;
  final int dst_until;
  final int raw_offset;
  final String timezone;
  final int unixtime;
  final int utc_datetime;
  final int utc_offset;
  final int week_number;

  const Album({
    required this.abbreviation,
    required this.client_id,
    required this.datetime,
    required this.day_of_week,
    required this.day_of_year,
    required this.dst,
    required this.dst_from,
    required this.dst_offset,
    required this.dst_until,
    required this.raw_offset,
    required this.timezone,
    required this.unixtime,
    required this.utc_datetime,
    required this.utc_offset,
    required this.week_number,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      abbreviation: json['abbreviation'],
      client_id: json['client_id'],
      datetime: json['datetime'],
      day_of_week: json['day_of_week'],
      day_of_year: json['day_of_year'],
      dst: json['dst'],
      dst_from: json['dst_from'],
      dst_offset: json['dst_offset'],
      dst_until: json['dst_until'],
      raw_offset: json['raw_offset'],
      timezone: json['timezone'],
      unixtime: json['unixtime'],
      utc_datetime: json['utc_datetime'],
      utc_offset: json['utc_offset'],
      week_number: json['week_number'],

    );
  }
}

class _MyAppState extends State<MyApp> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }
// ···
}

Future<http.Response> fetchAlbum() {
  return http.get(Uri.parse('https://worldtimeapi.org/api/timezone/America/Chicago'));
}