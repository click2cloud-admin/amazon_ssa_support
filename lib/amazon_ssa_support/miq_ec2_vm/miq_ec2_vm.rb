require_relative 'miq_ec2_ebs_image'
require_relative 'miq_ec2_ebs_instance'

module AmazonSsaSupport
  class MiqEC2Vm
    
    def self.new(ec2_id, host_instance, ec2, iargs=nil)
      ec2_obj = nil
      
      if ec2_id[0,4] == "ami-"
        ec2_obj = ec2.image(ec2_id)
        raise "MiqEC2Vm.getVm: EC2 Image #{ec2_id} not found" unless ec2_obj
        raise "MiqEC2Vm.getVm: Image of instance store isn't supported!" unless ec2_obj.root_device_type == "ebs"
        return MiqEC2EbsImage.new(ec2_obj, host_instance, ec2, iargs)
      elsif ec2_id[0,2] == "i-"
        ec2_obj = ec2.instance(ec2_id)
        raise "MiqEC2Vm.getVm: EC2 Instance #{ec2_id} not found" unless ec2_obj
        raise "MiqEC2Vm.getVm: Instance of instance store isn't supported!" unless ec2_obj.root_device_type == "ebs"
        return MiqEC2EbsInstance.new(ec2_obj, host_instance, ec2, iargs)
      else
        raise "MiqEC2Vm.getVm: unrecognized ec2 ID #{ec2_id}"
      end
    end
    
  end
end
