my class Exception {
    has $!ex;

    method Str() {
        nqp::p6box_s(nqp::atkey($!ex, 'message'))
    }

    method throw() {
        pir::throw__vP(nqp::getattr(self, Exception, '$!ex'))
    }
    method rethrow() {
        pir::rethrow__vP(nqp::getattr(self, Exception, '$!ex'))
    }
}

sub EXCEPTION(|$) {
    my $ex := nqp::create(Exception);
    nqp::bindattr($ex, Exception, '$!ex', 
        nqp::shift(pir::perl6_current_args_rpa__P()));
    $ex;
}
