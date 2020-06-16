unit    class       IBM::Spectrum::Protect::Admin::Client:api<1>:auth<Mark Devine (mark@markdevine.com)>;

use     Async::Command;

=finish

how to tell when the first command directive's output is completely drained?
should every reader be required to go line by line, because data returned could be too big for one cycle?

Async::Command::Interactive.submit (Channel:D $parser-channel, Str:D $directive) {
    self.active-parser-channel.close if self.active-parser-channel ~~ Channel:D;
    $!active-parser-channel = $parser-channel;
    without $!process {
        $!process           = Proc::Async.new(:w, :o, :e, $!command-base);
        $!process.stdout.lines.tap(-> $line { self.active-parser-channel.send: $line }, quit => { say 'Exception!!! ' ~ .^name });
        $!process.stderr.lines.tap(-> $error-message { $*ERR.put: "Error:  $error-message" });
        $!process-promise   = $!process.start;
    }
    await $!process.write(Buf.new($command.encode));
}
