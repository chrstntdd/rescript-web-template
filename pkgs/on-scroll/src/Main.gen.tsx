/* TypeScript file generated from Main.res by genType. */
/* eslint-disable import/first */

// @ts-ignore: Implicit any on import
import * as Curry__Es6Import from "rescript/lib/es6/curry.js"
const Curry: any = Curry__Es6Import

// @ts-ignore: Implicit any on import
import * as MainBS__Es6Import from "./Main.bs"
const MainBS: any = MainBS__Es6Import

export const onScroll: (
	l: (_1: number) => void,
	immediate: boolean,
) => (_1: boolean) => void = function (Arg1: any, Arg2: any) {
	const result = Curry._2(MainBS.onScroll, Arg1, Arg2)
	return result
}
