package DDG::Spice::GithubJobs;
# ABSTRACT: Search for jobs on Github.

use DDG::Spice;

spice to => 'http://jobs.github.com/positions.json?description=$1&location=$2&callback={{callback}}';
spice from => '(.*?)-(.*)';

triggers query_lc => qr/(?:(?:i\s+)?(?:need|want|deserve|seek)\s+(?:a\s+)?)?(?:(.+)\s+)?(?:jobs?|work)(?:\s+(?:in\s+)?(.+))?$/i;

handle query_lc => sub {
	if($1 && $2) {
		return $1.'-'.$2; 
	}
    if($1) {
		return $1.'-';
	}
	if($2) {
		return '-'.$2;
	}
	return;
};

1;