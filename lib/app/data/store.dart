// import 'dart:async';

// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:supabase/supabase.dart';

// class Store {
//   static const sessionKey = "SESSION_KEY";
//   final SupabaseClient supabaseClient;

//   Store(this.supabaseClient);

//   Future<String?> loginUser(String email, String password) async {
//     final response =
//         await this.supabaseClient.auth.signIn(email: email, password: password);
//     if (response.error != null) {
//       return response.error!.message;
//     } else if (response.data?.persistSessionString != null) {
//       final sharedPreferences = await SharedPreferences.getInstance();
//       sharedPreferences.setString(
//           sessionKey, response.data!.persistSessionString);
//     }
//     return null;
//   }

//   Future<String?> signUpUser(String email, String password) async {
//     final response = await this.supabaseClient.auth.signUp(email, password);
//     if (response.error != null) {
//       return response.error!.message;
//     }
//     return null;
//   }

//   Future<String?> recoverPassword(String email) async {
//     final response =
//         await this.supabaseClient.auth.api.resetPasswordForEmail(email);
//     if (response.error != null) {
//       return response.error!.message;
//     }
//     return null;
//   }

//   Future<bool> restoreSession() async {
//     final sharedPreferences = await SharedPreferences.getInstance();
//     final exist = sharedPreferences.containsKey(sessionKey);
//     if (!exist) {
//       return false;
//     }

//     final jsonStr = sharedPreferences.getString(sessionKey)!;
//     final res = await supabaseClient.auth.recoverSession(jsonStr);
//     if (res.error != null) {
//       await sharedPreferences.remove(sessionKey);
//       return false;
//     }
//     await sharedPreferences.setString(
//         sessionKey, res.data!.persistSessionString);
//     return true;
//   }

//   Future<dynamic> insert(String table, Map<String, dynamic> element) async {
//     element['user_id'] = supabaseClient.auth.currentUser!.id;
//     final res = await supabaseClient.from(table).insert(element).execute();
//     if (res.error != null) {
//       print(res.error?.message);
//       throw res.error!;
//     } else {
//       return res.data;
//     }
//   }

//   Future<dynamic> update(String table, Map<String, dynamic> element) async {
//     final id = supabaseClient.auth.currentUser!.id;
//     final res = await supabaseClient
//         .from(table)
//         .update(element)
//         .eq('user_id', id)
//         .eq('id', element['id'])
//         .execute();
//     if (res.error != null) {
//       print(res.error?.message);
//       throw res.error!;
//     } else {
//       return res.data;
//     }
//   }

//   Future<dynamic> delete(String table, Map<String, dynamic> element) async {
//     final id = supabaseClient.auth.currentUser!.id;
//     final res = await supabaseClient
//         .from(table)
//         .delete()
//         .eq('user_id', id)
//         .eq('id', element['id'])
//         .execute();
//     if (res.error != null) {
//       print(res.error?.message);
//       throw res.error!;
//     } else {
//       return res.data;
//     }
//   }

//   Stream<List<T>> getStream<T>(
//     String table,
//     T elementBuilder(dynamic), {
//     String selectClause = "*",
//   }) {
//     List<T> elements = [];
//     bool isPaused = false;
//     RealtimeSubscription? subscription;
//     StreamController<List<T>>? controller;

//     void update() {
//       if (!isPaused) {
//         controller?.add(List.from(elements));
//       }
//     }

//     void start() async {
//       final response =
//           await supabaseClient.from(table).select(selectClause).execute();
//       if (response.error == null) {
//         // Generate initial element list
//         elements =
//             List.from(response.data).map((msg) => elementBuilder(msg)).toList();
//         if (!isPaused) {
//           update();
//         }
//       } else {
//         controller?.addError(Error());
//       }
//       subscription =
//           supabaseClient.from(table).on(SupabaseEventTypes.all, (payload) {
//         switch (payload.eventType) {
//           case 'INSERT':
//             final element = elementBuilder(payload.newRecord);
//             elements.add(element);
//             update();
//             break;
//           case 'UPDATE':
//             final newElement = elementBuilder(payload.newRecord);
//             elements[elements.lastIndexOf(newElement)] = newElement;
//             update();
//             break;
//           case 'DELETE':
//             final oldElement = elementBuilder(payload.oldRecord);
//             elements.remove(oldElement);
//             update();
//             break;
//           default:
//         }
//       }).subscribe();
//     }

//     void pause() {
//       isPaused = true;
//     }

//     void resume() {
//       isPaused = false;
//       controller?.add(elements);
//     }

//     void cancel() {
//       subscription?.unsubscribe();
//       controller?.close();
//     }

//     controller = StreamController<List<T>>(
//         onListen: start, onPause: pause, onResume: resume, onCancel: cancel);

//     return controller.stream;
//   }
// }
