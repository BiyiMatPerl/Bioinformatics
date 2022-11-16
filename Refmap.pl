#!/usr/bin/perl
use warnings;
use strict;
use Data::Dumper;
# USAGE: PERL map.pl hashfile input_file output_file
# AUTHOR:  ADEBIYI SOBITAN
# DATE: MAY 28, 2019.
# MODIFIED: MARCH 15, 2021.
#   USAGE: perl Refmap.pl RSeq_maplist.txt cluster1.txt cluster1_gene.txt
# HOWARD UNIVERSITY

my %hash;
my @map_file;
my ($mapfile, $gene_id, $gene_name);

open (INID, "$ARGV[0]") || die "cannot open file:$ARGV[0].\n";
while ($mapfile = <INID>){
chomp $mapfile;
($gene_id, $gene_name) = split(" ", $mapfile, 2);

$hash{$gene_id} = $gene_name;

#print Dumper \%hash
}
my $ptmfile;
my @ptm_file;
my ($col_prot, $col_ptm);
open (INFILE, "$ARGV[1]") || die "cannot open file:$ARGV[1].\n";
open (OUTFILE, ">$ARGV[2]") || die "cannot write to file:$ARGV[2].\n";
$ptmfile = <INFILE>;
while (defined($ptmfile)){
chomp $ptmfile;
@ptm_file = split(" ", $ptmfile);
$col_prot = $ptm_file[0];
$col_ptm = $ptm_file[1];
my $none = 'none';

if ($hash{$gene_id} =~ $gene_name){
$col_prot =~ s/$_/$hash{$_}/g for keys %hash;
print OUTFILE "@ptm_file\t$col_prot\n";
}
else {
print OUTFILE "@ptm_file\t$none\n";
}
$mapfile = <INID>;
$ptmfile = <INFILE>;
}
close (INID);
close (INFILE);
close (OUTFILE);
