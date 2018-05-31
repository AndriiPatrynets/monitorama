title 'Monitorama Security Operations'

control 'prom-01' do
    title 'Allow Prometheus ssh access on port 22 from the world'
    
    describe aws_security_group(group_name: 'prometheus') do 
        # Allow RDP from a defined range and nothing else 
        # The SG must have this rule in position 1 and it must match this exactly 
        it { should allow_in_only(port: 22, ipv4_range: '0.0.0.0/0', position: 1) }
    end
  end
  
  control 'prom-02' do
    title 'Restrict Prometheus http access on port 9090 to internal network'
    
    describe aws_security_group(group_name: 'prometheus') do 
        # Specify position 2 for the SSH rule. Without position, 
        # allowinonly only allows one rule, total. 
        it { should allow_in_only(port: 9090, ipv4_range: '76.191.184.0/24', position: 2) }
    end
  end

