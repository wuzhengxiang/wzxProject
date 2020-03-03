Pod::Spec.new do |spec|
  spec.name         = 'wzxProject'
  spec.version      = '1.0.0'
  spec.license      = { :type => 'BSD' }
  spec.homepage     = 'https://github.com/wuzhengxiang/wzxProject.git'
  spec.authors      = { 'Tony Million' => '935988756@qq.com' }
  spec.summary      = 'ARC and GCD Compatible Reachability Class for iOS and OS X.'
  spec.source       = { :git => 'https://github.com/wuzhengxiang/wzxProject.git', :tag => 'v1.0.0' }
  spec.source_files = 'wzxProject.{h,m}'
  spec.framework    = 'SystemConfiguration'
end