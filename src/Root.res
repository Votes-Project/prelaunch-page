%%raw(`
import "./index.css";
import "@rainbow-me/rainbowkit/styles.css";

import { getDefaultWallets } from "@rainbow-me/rainbowkit";
import { configureChains, createConfig } from "wagmi";
import { optimism, goerli } from "wagmi/chains";
import { alchemyProvider } from "wagmi/providers/alchemy";
import { publicProvider } from "wagmi/providers/public";

const { chains, publicClient } = configureChains(
  [import.meta.env.NODE_ENV === "production" ? optimism : goerli],
  [
    alchemyProvider({ apiKey: import.meta.env.VITE_PRIVATE_ALCHEMY_ID }),

    publicProvider(),
  ]
);



const { connectors } = getDefaultWallets({
  appName: "My RainbowKit App",
  projectId: import.meta.env.VITE_WALLETCONNECT_PROJECT_ID,
  chains,
});
console.log(import.meta.env)

const wagmiConfig = createConfig({
  autoConnect: true,
  connectors,
  publicClient,
});

`)

module WagmiConfig = {
  @react.component @module("wagmi")
  external make: (~config: 'a, ~children: React.element) => React.element = "WagmiConfig"
}
module RainbowKitProvider = {
  @react.component @module("@rainbow-me/rainbowkit")
  external make: (~chains: 'a, ~children: React.element) => React.element = "RainbowKitProvider"
}
Js.log2("App: ", <App />)

ReactDOM.querySelector("#root")
->Option.getExn
->ReactDOM.Client.createRoot
->ReactDOM.Client.Root.render(
  <React.StrictMode>
    <WagmiConfig config={%raw(`wagmiConfig`)}>
      <RainbowKitProvider chains={%raw(`chains`)}>
        <App />
      </RainbowKitProvider>
    </WagmiConfig>
  </React.StrictMode>,
)
