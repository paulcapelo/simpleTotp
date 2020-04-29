/**
 * @author jpcapelo
 * @email jhonnathanp27@gmail.com
 * @create date 2020-04-28 23:04:04
 */
import { NativeModules,NativeEventEmitter } from 'react-native';

const { RNTotplibe } = NativeModules;


class TotpLibe extends NativeEventEmitter {
  constructor() {
		super(TotpLibe);
  }
  getTOTP(semilla,tiempo,fecha) {
		return RNTotplibe.getTOTP(semilla,tiempo,fecha);
	}
}

export default new TotpLibe;
