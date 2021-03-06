function ret = cd1(rbm_w, visible_data)
% <rbm_w> is a matrix of size <number of hidden units> by <number of visible units>
% <visible_data> is a (possibly but not necessarily binary) matrix of size <number of visible units> by <number of data cases>
% The returned value is the gradient approximation produced by CD-1. It's of the same shape as <rbm_w>.
	visible_data = sample_bernoulli(visible_data);
    hda = sample_bernoulli(visible_state_to_hidden_probabilities(rbm_w, visible_data));
	posgrad = configuration_goodness_gradient(visible_data,hda);
	
	vsb = sample_bernoulli(hidden_state_to_visible_probabilities(rbm_w, hda));
	hdb = visible_state_to_hidden_probabilities(rbm_w, vsb);
	neggrad = configuration_goodness_gradient(vsb,hdb);
	ret = posgrad - neggrad;
	%error('not yet implemented');
end
