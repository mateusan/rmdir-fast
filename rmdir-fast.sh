#!/bin/sh

EmptyDir=$(mktemp -d)
TargetDir="$1"
PrefixCommand=""

if [ "$2" = '--ionice' ]; then
	PrefixCommand='ionice -c3'
fi

$PrefixCommand rsync -a --delete $EmptyDir/ "$TargetDir"/
$PrefixCommand rm -rf "$TargetDir"
$PrefixCommand rm -rf $EmptyDir/
exit 0;
