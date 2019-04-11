function etaPRIME_acc = compute_force_etaPRIME_screenedCoulombInteraction(etaPRIME_acc, num_particles, num_dimensions,...
       gamma_packet_width, simulation_step,...
       mass, reduced_planck_constant, ...
       Z, e, q_pos, lambda)
   
   for particle_itr = 1:num_particles
       norm_q = norm(q_pos(1:num_dimensions, particle_itr, simulation_step));
       gamma = gamma_packet_width(particle_itr, simulation_step);
       
       etaPRIME_acc(particle_itr, simulation_step) = ((9 * reduced_planck_constant^2) / ((4 * mass^2 * gamma.^3))) + ...
           ((Z*e^2.*gamma)./(6*lambda^2.*norm_q)) * erfc((gamma)./(sqrt(6)*lambda) - (sqrt(3/2).*(norm_q./gamma))) * exp(-norm_q./lambda + ((gamma.^2)./(6*lambda^2))) - ...
           ((Z*e^2*gamma)./(6*lambda^2.*norm_q)) * erfc((gamma)./(sqrt(6)*lambda) + (sqrt(3/2).*(norm_q./gamma))) * exp(norm_q./lambda + ((gamma.^2)./(6*lambda^2))) - ...
           sqrt(6/pi) * ((Z*e^2)./(gamma.^2)) * e^((-3 .* norm_q.^2)./(2 .* gamma.^2));
   end
   
end