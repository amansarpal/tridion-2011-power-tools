﻿using System;
using System.ServiceModel.Web;
using System.Threading;
using System.Security.Principal;
using Tridion.ContentManager;
using System.ServiceModel;
using System.ServiceModel.Activation;
using PowerTools2011.Services.Progress;


namespace PowerTools2011.Services.Example
{
	[ServiceBehavior(InstanceContextMode = InstanceContextMode.Single, ConcurrencyMode = ConcurrencyMode.Multiple)]
	[AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Required)]
    [ServiceContract(Namespace = "")]
    public class ExampleService : BaseService
	{
        [OperationContract, WebGet(ResponseFormat = WebMessageFormat.Json)]
        public ServiceProcess Execute()
        {
            return ExecuteAsync(null);
        }

        [OperationContract, WebGet(ResponseFormat = WebMessageFormat.Json)]
        public override ServiceProcess GetProcessStatus(string Id)
        {
            return base.GetProcessStatus(Id);
        }

        public override void Process(ServiceProcess process, object arguments)
		{
			while (process.PercentComplete < 100)
			{
				process.IncrementCompletePercentage();
                process.SetStatus("Loading...");

				Random rnd = new Random(DateTime.Now.GetHashCode());
				Thread.Sleep(((int)(rnd.NextDouble() * 4) + 10) * 10);
			}
            process.Complete();
		}
	}
}



