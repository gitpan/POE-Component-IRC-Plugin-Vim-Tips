use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'POE::Component::IRC::Plugin::Vim::Tips',
    AUTHOR              => q{Curtis Brandt <curtis@cpan.org>},
    VERSION_FROM        => 'lib/POE/Component/IRC/Plugin/Vim/Tips.pm',
    ABSTRACT_FROM       => 'lib/POE/Component/IRC/Plugin/Vim/Tips.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'POE-Component-IRC-Plugin-Vim-Tips-*' },
);
