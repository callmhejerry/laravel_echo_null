import '../connector/connector.dart';

abstract class Channel {
  /// The Echo options.
  final ConnectorOptions options;

  const Channel(this.options);

  /// Listen for an event on the channel instance.
  Channel listen(String event, Function callback);

  /// subscribe channel
  void subscribe();

  /// Unsubscribe channel
  void unsubscribe();

  /// Listen for a whisper event on the channel instance.
  Channel listenForWhisper(String event, Function callback) =>
      listen('.client-$event', callback);

  /// Listen for an event on the channel instance.
  Channel notification(Function callback) => listen(
        '.Illuminate\\Notifications\\Events\\BroadcastNotificationCreated',
        callback,
      );

  /// Stop listening to an event on the channel instance.
  Channel stopListening(String event, [Function? callback]);

  /// Stop listening for a whisper event on the channel instance.
  Channel stopListeningForWhisper(String event, [Function? callback]) =>
      stopListening('.client-$event', callback);

  /// Register a callback to be called anytime a subscription succeeds.
  Channel subscribed(Function callback);

  /// Register a callback to be called anytime an error occurs.
  Channel error(Function callback);
}
