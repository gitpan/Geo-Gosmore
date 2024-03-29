
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Interface to the headless L<gosmore(1)> routing application',
  'AUTHOR' => 'Ævar Arnfjörð Bjarmason <avar@cpan.org>',
  'BUILD_REQUIRES' => {
    'File::Find' => '0',
    'File::Temp' => '0',
    'Test::More' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.30'
  },
  'DISTNAME' => 'Geo-Gosmore',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Geo::Gosmore',
  'PREREQ_PM' => {
    'Any::Moose' => '0',
    'Cwd' => '0',
    'Data::Dumper' => '0',
    'File::Basename' => '0',
    'Geo::Distance::XS' => '0',
    'IPC::System::Simple' => '0',
    'WWW::Mechanize' => '0',
    'autodie' => '0'
  },
  'VERSION' => '0.05',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



