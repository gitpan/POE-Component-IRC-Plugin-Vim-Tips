use strict;
use warnings;

use Benchmark qw(timethese);
use HTML::TreeBuilder::XPath;
use LWP::Simple qw(get);
use Mojo::JSON;

timethese(
    $ARGV[0] || 100,
    {   control => sub {
            my $content = get('http://twitter.com/vimtips');
            my @tips    = 1 .. 20;
            return $tips[rand @tips];
        },
        tree => sub {
            my $content = get('http://twitter.com/vimtips');
            my $tree    = HTML::TreeBuilder::XPath->new;
            $tree->parse($content);
            my @tips = $tree->findvalues(    #
                './/li[@data-item-type="tweet"]//p[@class="js-tweet-text"]'
            );
            return @tips ? $tips[rand @tips] : '';
        },
        json => sub {
            my $content = get('http://twitter.com/users/show_for_profile.json?screen_name=vimtips');
            my $json    = Mojo::JSON->new;
            my $hash = eval { $json->decode($content) };    #)) { warn Dumper $hash }
            if (ref($hash) && ref($hash) eq 'HASH') {
                my @tips = map $_->{text}, @{$hash->{timeline}};
                return $tips[rand @tips] if @tips;
            }
            return '';
          }
    }
);

#sub tree {
#    my $content = get('http://twitter.com/vimtips');
#    my $tree    = HTML::TreeBuilder::XPath->new;
#    $tree->parse($content);
#    my @tips = $tree->findvalues(    #
#        './/li[@data-item-type="tweet"]//p[@class="js-tweet-text"]'
#    );
#    return @tips ? $tips[rand @tips] : '';
#}
#
#sub json {
#    my $content = get('http://twitter.com/users/show_for_profile.json?screen_name=vimtips');
#    my $json    = Mojo::JSON->new;
#    my $hash = eval { $json->decode($content) };    #)) { warn Dumper $hash }
#    if (ref($hash) && ref($hash) eq 'HASH') {
#        my @tips = map $_->{text}, @{$hash->{timeline}};
#        return $tips[rand @tips] if @tips;
#    }
#    return '';
#}
#
#warn control
##warn tree;
##warn json;
