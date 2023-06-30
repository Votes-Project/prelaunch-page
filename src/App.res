module ConnectButton = {
  @react.component @module("@rainbow-me/rainbowkit")
  external make: unit => React.element = "ConnectButton"
}

@react.component
let make = () => {
  <div className="flex bg-black text-white justify-center items-center w-screen h-screen">
    <ConnectButton />
  </div>
}
