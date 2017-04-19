require 'MiqVm/MiqVm'

module AmazonSsaSupport
  class MiqEC2VmBase
    
    def initialize(ec2_obj, host_instance, ec2, iargs)
      @ec2_obj       = ec2_obj
      @host_instance = host_instance
      @ec2           = ec2
      @instance_args = iargs
    end
    
  end
end
