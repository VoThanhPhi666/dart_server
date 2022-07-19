import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf/shelf.dart' as shelf;

int port = 8080;
String serverName = 'dartServer';
Future<void> main(List<String> arguments) async {
  var handler = shelf.Pipeline().addHandler((request) => handle(request));
  var server = await io.serve(handler, InternetAddress.anyIPv4, port);

  server.defaultResponseHeaders.contentType = ContentType.json;
  server.autoCompress = true;
}

FutureOr<shelf.Response> handle(shelf.Request request) async {
  shelf.Response? response;
  switch (request.method) {
    case "GET":
      {
        print("get");
        response = handleGet(request);
        break;
      }
    case "POST":
      {
        print("post");
        response = handlePost(request);
        break;
      }
  }
  return response ??
      shelf.Response(200,
          body: jsonEncode([
            {"message": "error"}
          ]));
}

shelf.Response handleGet(shelf.Request request) {
  var response = [
    {
      "name": "phichodien1",
      "age": 22,
      "address": "341a le trong tan",
      "cccd": 574843647,
      "city": "HCM"
    },
    {
      "name": "phichodien2",
      "age": 22,
      "address": "341a le trong tan",
      "cccd": 574843647,
      "city": "HCM"
    },
    {
      "name": "phichodien3",
      "age": 22,
      "address": "341a le trong tan",
      "cccd": 574843647,
      "city": "HCM"
    },
    {
      "name": "phichodien4",
      "age": 22,
      "address": "341a le trong tan",
      "cccd": 574843647,
      "city": "HCM"
    }
  ];
  if (request.url == Uri(path: 'users')) {
    return shelf.Response(200, body: jsonEncode(response));
  }
  return shelf.Response(200, body: jsonEncode({"message": "error"}));
}

shelf.Response handlePost(shelf.Request request) {
  var response = [
    {
      "name": "vo thanh phi1",
      "age": 22,
      "address": "98 phan van han",
      "cccd": 5748694950,
      "city": "HN"
    },
    {
      "name": "vo thanh phi2",
      "age": 22,
      "address": "98 phan van han",
      "cccd": 5748694950,
      "city": "HN"
    },
    {
      "name": "vo thanh phi3",
      "age": 22,
      "address": "98 phan van han",
      "cccd": 5748694950,
      "city": "HN"
    },
    {
      "name": "vo thanh phi4",
      "age": 22,
      "address": "98 phan van han",
      "cccd": 5748694950,
      "city": "HN"
    }
  ];

  if (request.url == Uri(path: 'users')) {
    return shelf.Response(200, body: jsonEncode(response));
  }
  return shelf.Response(200, body: jsonEncode({"message": "error"}));
}
