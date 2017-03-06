function G = configuration_goodness(rbm_w, visible_state, hidden_state)
% <rbm_w> is a matrix of size <number of hidden units> by <number of visible units>
% <visible_state> is a binary matrix of size <number of visible units> by <number of configurations that we're handling in parallel>.
% <hidden_state> is a binary matrix of size <number of hidden units> by <number of configurations that we're handling in parallel>.
% This returns a scalar: the mean over cases of the goodness (negative energy) of the described configurations.
    sjtu = hidden_state'*rbm_w*visible_state;
	sss = size(sjtu,1);
	mmm = size(sjtu,2);
	dick = ones(1,sss);
	dia = diag(dick);
	dsjtu = sjtu.*dia;
	asjtu = sum(dsjtu,1);
	bsjtu = sum(asjtu,2);
	G = bsjtu/sss;
	%error('not yet implemented');
end